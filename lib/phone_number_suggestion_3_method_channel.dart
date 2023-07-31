import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'phone_number_suggestion_3_platform_interface.dart';

/// An implementation of [PhoneNumberSuggestion_3Platform] that uses method channels.
class MethodChannelPhoneNumberSuggestion_3 extends PhoneNumberSuggestion_3Platform {
  /// The method channel used to interact with the native platform.

  @visibleForTesting
  final methodChannel = const MethodChannel('phone_number_suggestion_3');
  /**
   * padmanabhh 123
   */
  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
