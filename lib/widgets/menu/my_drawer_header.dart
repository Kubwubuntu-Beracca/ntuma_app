// ignore_for_file: prefer_const_constructors, unnecessary_string_interpolations, non_constant_identifier_names, prefer_typing_uninitialized_variables, use_key_in_widget_constructors
import 'package:flutter/material.dart';

class MyHeaderDraweWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      width: double.infinity,
      height: 200,
      padding: EdgeInsets.only(top: 60),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10),
            height: 70,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage("assets/images/menu/avatar.png"))),
          ),
          Text(
            'Kubwubuntu',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text('buntujedi@gmail.com',
              style: TextStyle(fontSize: 14, color: Colors.grey[200]))
        ],
      ),
    );
  }
}
