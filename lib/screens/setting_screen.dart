// ignore_for_file: prefer_const_constructors

import 'package:delivery_app/screens/login_screen.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  static const routeName = '/settings';
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    bool lightMode = true;
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          title: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const <Widget>[
                SizedBox(width: 40),
                Icon(Icons.settings),
                SizedBox(width: 10),
                Text(
                  'Settings',
                  style: TextStyle(color: Colors.black),
                )
              ],
            ),
          ),
        ),
        body: Column(children: <Widget>[
          Container(
            padding: EdgeInsets.all(5),
            child: ListTile(
              title: Text(
                'Kubwubuntu',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.w700),
              ),
              subtitle: Text('buntujedi@gmail.com'),
              trailing: CircleAvatar(
                  child: Image.asset('assets/images/menu/avatar.png')),
            ),
          ),
          Card(
            margin: EdgeInsets.all(20.0),
            elevation: 2,
            child: Column(
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.settings),
                  title: Text('App Settings',
                      style: TextStyle(
                        fontSize: 20,
                      )),
                ),
                ListTile(
                    leading: Icon(
                      Icons.wb_sunny,
                    ),
                    title: Text('Theme'),
                    trailing: Switch.adaptive(
                        value: lightMode,
                        onChanged: (val) {
                          setState(() {
                            lightMode = val;
                          });
                        })),
                ListTile(
                  leading: Icon(Icons.translate),
                  title: Text('Language'),
                  trailing: Text('English'),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(20.0),
            height: 50,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                  side: BorderSide(width: 1, color: Colors.red)),
              onPressed: () {
                Navigator.of(context)
                    .pushReplacementNamed(LoginScreen.routeName);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.logout,
                    color: Colors.red,
                  ),
                  SizedBox(width: 20),
                  Text(
                    'Log out',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                        fontSize: 20),
                  )
                ],
              ),
            ),
          )
        ]));
  }
}
