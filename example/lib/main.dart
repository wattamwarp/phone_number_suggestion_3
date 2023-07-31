import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
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
  String _platformVersion = 'Unknown';
  final _phoneNumberSuggestion_3Plugin = PhoneNumberSuggestion_3();
   PhoneNumberSuggestionResponse pluginData =PhoneNumberSuggestionResponse(data: '',type: PhoneNumberSuggestionType.none);
  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    // try {
    //   platformVersion ='';
    //   pluginData = await _phoneNumberSuggestion_3Plugin.getPhoneNumber();
    // } on PlatformException {
    //   platformVersion = 'Failed to get platform version.';
    // }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    // if (!mounted) return;
    //
    // setState(() {
    //   a;
    //   _platformVersion = platformVersion;
    // });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            children: [
              Text('Running on: $_platformVersion\n'),
              Text('phone test on123: ${pluginData.data}\n'),
            ],
          ),
        ),
        floatingActionButton: InkWell(
          onTap: ()async{
            pluginData = await _phoneNumberSuggestion_3Plugin.getPhoneNumber();
            setState(()  {
              pluginData=pluginData;
            });
          },
          child: Container(
            height: 50,
            width: 100,
            color: Colors.red,
            child: const Center(child: Text('press')),
          ),
        ),
      ),
    );
  }
}
