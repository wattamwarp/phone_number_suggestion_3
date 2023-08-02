import 'package:flutter/services.dart';
import 'package:phone_number_suggestion_3/helper/enums.dart';
import 'helper/constants.dart';
import 'models/phone_number_suggestion_model.dart';

class PhoneNumberSuggestion_3 {
  /// Fetches a phone number suggestion using the specified [type].
  /// The returned [PhoneNumber] object represents the result of the suggestion operation.
  ///
  /// Parameters:
  ///   - [type]: The type of suggestion to use, with [SuggestionType.BottomSheet] being the default.
  ///             Currently, only [SuggestionType.BottomSheet] is supported.
  ///
  /// Returns:
  ///   - A [Future] that completes with a [PhoneNumber] object representing the result of the suggestion operation.
  ///     If the suggestion is successful, it returns a [Success] instance with the fetched phone number.
  ///     If the suggestion is closed by the user, it returns a [ClosedByUser] instance.
  ///     If an error occurs during the suggestion, it returns a [Failure] instance with the corresponding error message.
  ///
  /// Examples:
  /// ```dart
  /// // Example of using the getPhoneNumber method with the default SuggestionType.BottomSheet.
  /// void phoneNumberSuggestion() async{
  ///   await _phoneNumberSuggestion_3Plugin.getPhoneNumber();
  ///   switch (pluginData.runtimeType) {
  ///     case Success:
  ///       print('Phone number: ${(pluginData as Success).phoneNumber}');
  ///       break;
  ///     case Failure:
  ///       print('Error message: ${(pluginData as Failure).errorMessage}');
  ///       break;
  ///     case ClosedByUser:
  ///       print('Closed by user');
  ///       break;
  ///     case NoneOfTheSelected:
  ///       print('Error occurred');
  ///       break;
  ///     default:
  ///       print('Unknown type');
  ///       break;
  ///   }
  /// }
  /// ```
  Future<PhoneNumber> getPhoneNumber(
      {SuggestionType type = SuggestionType.BottomSheet}) async {
    switch (type) {
      case SuggestionType.BottomSheet:
        return await _invokeBottomSheet();
      default:
        // Currently, only SuggestionType.BottomSheet is supported, so other types will result in a Failure.
        Failure(errorMessage: '');
    }
    return Failure(errorMessage: '');
  }

  /// Invokes the Google provided bottom sheet for phone number suggestions.
  Future<PhoneNumber> _invokeBottomSheet() async {
    try {
      /// Invoke the native platform method using the MethodChannel to show the bottom sheet.
      final map =
          await const MethodChannel(channelName).invokeMethod(bottomSheetHint);
      /// Parse the returned data using the fromJson function to create the PhoneNumber instance.
      return fromJson(map: map);
    } on PlatformException catch (e) {
      /// Handle platform-specific exceptions, such as missing platform support or errors during the method invocation.
      return Failure(errorMessage: e.message.toString());
    } catch (e) {
      /// Handle other generic exceptions that might occur during the method invocation or data parsing.
      return Failure(errorMessage: e.toString());
    }
  }
}
