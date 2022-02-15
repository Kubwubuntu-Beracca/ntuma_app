// ignore_for_file: unused_field

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_user_agentx/flutter_user_agent.dart';
import 'package:device_info/device_info.dart';
//import 'package:platform_device_id/platform_device_id.dart';
//import 'package:platform_device_id/platform_device_id.dart';

class AddUser extends StatefulWidget {
  static const routeName = '/addUser';
  @override
  State<AddUser> createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  static final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  Map<String, dynamic> _deviceData = <String, dynamic>{};
  final _formKey = GlobalKey<FormState>();
  String _userAgent = '<unknown>';
  String _webUserAgent = '<unknown>';
  String deviceName = "", deviceVersion = "", identifier = "";

  String? deviceId;
  var _email;
  var _password;
  var host = 'https://testgate.ihela.online/apiv1';
  var appVersion = "3.0.4+62";
  // static final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  String sign =
      'eyJiYW5rX3NsdWciOiJpSGVsYUFwcGxpcyIsIkFQUF9UWVBFIjoiSU5ESVZJRFVBTE1PQklMRSIsIkFQUF9WRVJTSU9OIjoiMy4wLjQrNjEifQ:1mC0MY:57FdqV2agJlEyugyRSVoU4JLnjU';

  void initState() {
    super.initState();
    // initPlatformState();
    initUserAgentState();
    getDeviceDetails();
  }

  Future<void> getDeviceDetails() async {
    final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    try {
      if (Platform.isAndroid) {
        var build = await deviceInfoPlugin.androidInfo;
        setState(() {
          deviceName = build.model;
          deviceVersion = build.version.toString();
          identifier = build.androidId;
        });
        print(deviceName);
        print(deviceVersion);
        print(identifier);
      } else if (Platform.isIOS) {
        var data = await deviceInfoPlugin.iosInfo;
        setState(() {
          deviceName = data.name;
          deviceVersion = data.systemVersion.toString();
          identifier = data.identifierForVendor;
        });
        print(deviceName);
        print(deviceVersion);
        print(identifier);
      }
    } on PlatformException {
      print('Failed to get  platform version');
    }
  }

  Future<void> fetchAuthenticateUsers(String email, String password) async {
    var url = '${host}/users/login';
    try {
      Map<String, dynamic> body = {
        'user': {
          "email": email,
          "password": password,
          "device_id": identifier,
          "app_version": appVersion,
          "profile_type": 'I',
        }
      };
      var bodyEncoded = json.encode(body);
      var response =
          await http.post(Uri.parse(url), body: bodyEncoded, headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
        "User-Agent": _userAgent,
        "-X-iHela-Signature": sign,
      });
      print(response);
    } catch (exception) {}
  }

  Future<void> initUserAgentState() async {
    String userAgent, webViewUserAgent;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      userAgent = await FlutterUserAgent.getPropertyAsync('userAgent');
      await FlutterUserAgent.init();
      webViewUserAgent = FlutterUserAgent.webViewUserAgent!;
      print('''
      applicationVersion => ${FlutterUserAgent.getProperty('applicationVersion')}
      systemName         => ${FlutterUserAgent.getProperty('systemName')}
      userAgent          => $userAgent
      webViewUserAgent   => $webViewUserAgent
      packageUserAgent   => ${FlutterUserAgent.getProperty('packageUserAgent')}
      ''');
    } on PlatformException {
      userAgent = webViewUserAgent = '<error>';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _userAgent = userAgent;
      _webUserAgent = webViewUserAgent;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    new SizedBox(
                      height: 150,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Email',
                      ),
                      onSaved: (input) {
                        _email = input;
                      },
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Password',
                      ),
                      onSaved: (input) {
                        _password = input;
                      },
                    )
                  ],
                )),
            ElevatedButton(
              child: Text('Send'),
              onPressed: () {
                fetchAuthenticateUsers(_email, _password);
              },
            )
          ],
        ),
      ),
    );
  }
}
