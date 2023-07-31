//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <phone_number_suggestion_3/phone_number_suggestion_3_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) phone_number_suggestion_3_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "PhoneNumberSuggestion_3Plugin");
  phone_number_suggestion_3_plugin_register_with_registrar(phone_number_suggestion_3_registrar);
}
