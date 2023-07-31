import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:phone_number_suggestion_3/helper/enums.dart';
import 'helper/constants.dart';
import 'models/phone_number_suggestion_model.dart';

class PhoneNumberSuggestion_3 {
  /**
   * Fetches phone number suggestions based on the specified [type].
   *
   * @param type The type of suggestion to use: [SuggestionType.BottomSheet] or [SuggestionType.DialogBox].
   * @return A [Future] that resolves to a [PhoneNumberSuggestionResponse] containing [PhoneNumberSuggestionType] type and [String] data.
   */
  Future<PhoneNumberSuggestionResponse> getPhoneNumber(
      {SuggestionType type = SuggestionType.BottomSheet}) async {
    switch (type) {
      case SuggestionType.BottomSheet:
        return  await _invokeBottomSheet();
      default:
        PhoneNumberSuggestionResponse();
    }
    return PhoneNumberSuggestionResponse();
  }

  /**
   * Invokes the Google provided bottom sheet for phone number suggestions.
   * @return A [Future] that resolves to a [PhoneNumberSuggestionResponse].
   * If the operation is successful, the response contains the type [PhoneNumberSuggestionType] and the data [String].
   * If an error occurs during the operation, the response contains [PhoneNumberSuggestionType.errorOccurred]  and the data [String].
   */
  Future<PhoneNumberSuggestionResponse> _invokeBottomSheet() async {
    try {
      final version =
          await const MethodChannel(channelName).invokeMethod(bottomSheetHint);
      return PhoneNumberSuggestionResponse.fromJson(version);
    } on PlatformException catch (e) {
      return PhoneNumberSuggestionResponse(
          type: PhoneNumberSuggestionType.errorOccurred,
          data: e.message.toString());
    } catch (e) {
      return PhoneNumberSuggestionResponse(
          type: PhoneNumberSuggestionType.errorOccurred, data: e.toString());
    }
  }
}
