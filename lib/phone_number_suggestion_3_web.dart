// In order to *not* need this ignore, consider extracting the "web" version
// of your plugin as a separate package, instead of inlining it in the same
// package as the core of your plugin.
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html show window;

import 'package:flutter_web_plugins/flutter_web_plugins.dart';

import 'phone_number_suggestion_3_platform_interface.dart';

/// A web implementation of the PhoneNumberSuggestion_3Platform of the PhoneNumberSuggestion_3 plugin.
class PhoneNumberSuggestion_3Web extends PhoneNumberSuggestion_3Platform {
  /// Constructs a PhoneNumberSuggestion_3Web
  PhoneNumberSuggestion_3Web();

  static void registerWith(Registrar registrar) {
    PhoneNumberSuggestion_3Platform.instance = PhoneNumberSuggestion_3Web();
  }

  /// Returns a [String] containing the version of the platform.
  @override
  Future<String?> getPlatformVersion() async {
    final version = html.window.navigator.userAgent;
    return version;
  }
}
