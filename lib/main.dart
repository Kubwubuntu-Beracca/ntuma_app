// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, non_constant_identifier_names, prefer_typing_uninitialized_variables

import 'package:delivery_app/screens/add_user.dart';
import 'package:delivery_app/screens/login_screen.dart';
import 'package:delivery_app/screens/order_screen.dart';
import 'package:delivery_app/screens/profile_screen.dart';
import 'package:delivery_app/screens/setting_screen.dart';
import 'package:delivery_app/screens/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: const SplashScreen(),
      routes: {
        '/': (ctx) => const SplashScreen(),
        OrderScreen.routeName: (ctx) => OrderScreen(),
        ProfileScreen.routeName: (ctx) => const ProfileScreen(),
        SettingScreen.routeName: (ctx) => SettingScreen(),
        LoginScreen.routeName: (ctx) => const LoginScreen(),
        AddUser.routeName: (ctx) => AddUser()
      },
    );
  }
}
