import 'package:flutter_test/flutter_test.dart';
import 'package:phone_number_suggestion_3/phone_number_suggestion_3.dart';
import 'package:phone_number_suggestion_3/phone_number_suggestion_3_platform_interface.dart';
import 'package:phone_number_suggestion_3/phone_number_suggestion_3_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockPhoneNumberSuggestion_3Platform
    with MockPlatformInterfaceMixin
    implements PhoneNumberSuggestion_3Platform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final PhoneNumberSuggestion_3Platform initialPlatform = PhoneNumberSuggestion_3Platform.instance;

  test('$MethodChannelPhoneNumberSuggestion_3 is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelPhoneNumberSuggestion_3>());
  });

  test('getPlatformVersion', () async {
    PhoneNumberSuggestion_3 phoneNumberSuggestion_3Plugin = PhoneNumberSuggestion_3();
    MockPhoneNumberSuggestion_3Platform fakePlatform = MockPhoneNumberSuggestion_3Platform();
    PhoneNumberSuggestion_3Platform.instance = fakePlatform;

    expect(42, '42');
  });
}
