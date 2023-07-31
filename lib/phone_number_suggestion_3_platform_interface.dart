import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'phone_number_suggestion_3_method_channel.dart';

abstract class PhoneNumberSuggestion_3Platform extends PlatformInterface {
  /// Constructs a PhoneNumberSuggestion_3Platform.
  PhoneNumberSuggestion_3Platform() : super(token: _token);

  static final Object _token = Object();

  static PhoneNumberSuggestion_3Platform _instance = MethodChannelPhoneNumberSuggestion_3();

  /// The default instance of [PhoneNumberSuggestion_3Platform] to use.
  ///
  /// Defaults to [MethodChannelPhoneNumberSuggestion_3].
  static PhoneNumberSuggestion_3Platform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [PhoneNumberSuggestion_3Platform] when
  /// they register themselves.
  static set instance(PhoneNumberSuggestion_3Platform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
