// ignore_for_file: sized_box_for_whitespace, avoid_unnecessary_containers

import 'package:flutter/material.dart';

class SplashWidget extends StatelessWidget {
  const SplashWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                height: 150,
                width: 150,
                child: Image.asset(
                  'assets/images/splash_screen_icons/icon.png',
                  fit: BoxFit.cover,
                )),
            const Text('Delivery App',
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold))
          ]),
    );
  }
}
