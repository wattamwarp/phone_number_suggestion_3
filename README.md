[![pub package](https://img.shields.io/pub/v/http.svg)](https://pub.dev/packages/phone_number_sugesstion) [![package publisher](https://img.shields.io/pub/publisher/http.svg)](https://pub.dev/packages/phone_number_sugesstion)

# Phone Number Suggestion Plugin

Phone Number Suggestion Plugin is a Flutter plugin that allows you to fetch phone number suggestions using a bottom sheet. The plugin communicates with the native platform to show the bottom sheet and retrieve the phone number suggestion.

## Features

- Fetch phone number suggestions using a bottom sheet.
- Handle different result cases such as success, failure, closed by user, or error occurred.

## Installation

To use the Phone Number Suggestion Plugin, add it to your `pubspec.yaml` file:

```yaml
dependencies:
  phone_number_suggestion_plugin: ^1.0.0 # Replace with the latest version
```
Then, install the dependencies by running:
```bash
flutter pub get
```
## Usage
To fetch the phone number suggestion, call the _invokeBottomSheet method:

 ```dart 
 import 'package:flutter/material.dart';
import 'package:phone_number_suggestion_plugin/phone_number_suggestion_plugin.dart';

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        PhoneNumber phoneNumber = await _invokeBottomSheet();
        String message = printMessage(pluginData: phoneNumber);
        /// Handle the suggestion result using the 'message'.
      },
      child: Text('Fetch Phone Number'),
    );
  }
}
```

You can use the getMessage function to handle different result cases:

```dart
void printMessage({required PhoneNumber pluginData}) {
  switch (pluginData.runtimeType) {
    case Success:
      print('Phone number: ${(pluginData as Success).phoneNumber}');
      break;
    case Failure:
      print('Error message: ${(pluginData as Failure).errorMessage}');
      break;
    case ClosedByUser:
      print('Closed by user');
      break;
    case NoneOfTheSelected:
      print('Error occurred');
      break;
    default:
      throw Exception('Unknown type: ${pluginData.runtimeType}');
  }
}
```

# Contributing
Contributions to the Phone Number Suggestion Plugin are welcome! If you find a bug, have a feature request, or want to contribute to the project, please follow the contribution guidelines.

# License
This project is licensed under the MIT License - see the LICENSE file for details.

## Buy Me a Coffee
<a href="https://github.com/wattamwarp" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/default-orange.png" alt="Buy Me A Coffee" height="41" width="174"></a>