#ifndef FLUTTER_PLUGIN_PHONE_NUMBER_SUGGESTION_3_PLUGIN_H_
#define FLUTTER_PLUGIN_PHONE_NUMBER_SUGGESTION_3_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace phone_number_suggestion_3 {

class PhoneNumberSuggestion_3Plugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  PhoneNumberSuggestion_3Plugin();

  virtual ~PhoneNumberSuggestion_3Plugin();

  // Disallow copy and assign.
  PhoneNumberSuggestion_3Plugin(const PhoneNumberSuggestion_3Plugin&) = delete;
  PhoneNumberSuggestion_3Plugin& operator=(const PhoneNumberSuggestion_3Plugin&) = delete;

  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace phone_number_suggestion_3

#endif  // FLUTTER_PLUGIN_PHONE_NUMBER_SUGGESTION_3_PLUGIN_H_
