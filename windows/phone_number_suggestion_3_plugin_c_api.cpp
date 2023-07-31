#include "include/phone_number_suggestion_3/phone_number_suggestion_3_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "phone_number_suggestion_3_plugin.h"

void PhoneNumberSuggestion_3PluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  phone_number_suggestion_3::PhoneNumberSuggestion_3Plugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
