// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace, prefer_const_constructors

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:delivery_app/screens/login_screen.dart';
import 'package:delivery_app/screens/order_screen.dart';
import 'package:delivery_app/widgets/background_image.dart';
import 'package:delivery_app/widgets/splash.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Stack(
        children: [
          Container(
            color: Colors.white,
          ),
          BackGroundImages(
              images: "assets/images/splash_screen_icons/splash.png")
        ],
      ),
      Scaffold(
        backgroundColor: Colors.transparent,
        body: AnimatedSplashScreen(
          backgroundColor: Colors.transparent,
          splash: SplashWidget(),
          nextScreen: OrderScreen(),
          duration: 4000,
          splashTransition: SplashTransition.sizeTransition,
          pageTransitionType: PageTransitionType.rightToLeft,
        ),
      ),
    ]);
  }
}
