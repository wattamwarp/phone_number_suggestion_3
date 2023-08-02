import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:phone_number_suggestion_3/models/phone_number_suggestion_model.dart';
import 'package:phone_number_suggestion_3/phone_number_suggestion_3.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _phoneNumberSuggestion_3Plugin = PhoneNumberSuggestion_3();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: const Center(
          child: Column(
            children: [
              Text('Made for Vahak by VAHAK'),
            ],
          ),
        ),
        floatingActionButton: InkWell(
          onTap: () async {
            onCLickPress(context: context);
          },
          child: Container(
            height: 50,
            width: 100,
            color: Colors.blue,
            child: const Center(child: Text('HIT ME')),
          ),
        ),
      ),
    );
  }

  void onCLickPress({required BuildContext context}) async {
    PhoneNumber pluginData =
        await _phoneNumberSuggestion_3Plugin.getPhoneNumber();

    showToast(message: getMessage(pluginData: pluginData));
  }

  String getMessage({required PhoneNumber pluginData}) {
    switch (pluginData) {
      case Success():
        return pluginData.phoneNumber;
      case Failure():
        return pluginData.errorMessage;
      case ClosedByUser():
        return 'closed by user';
      case NoneOfTheSelected():
        return 'error occurred';
    }
  }

  void showToast({required String message}) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
