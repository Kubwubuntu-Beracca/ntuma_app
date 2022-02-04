// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

Widget MyDrawerListWidget() {
  return Container(
    padding: EdgeInsets.only(top: 15),
    child: Column(
      children: [
        MenuItem(),
      ],
    ),
  );
}

Widget MenuItem() {
  return Material(
    child: InkWell(
      onTap: () {},
      child: Padding(
        padding: EdgeInsets.all(15.0),
        child: Row(
          children: [
            Expanded(
                child: Icon(
              Icons.person,
              size: 20,
              color: Colors.black45,
            )),
            Expanded(
              child: Text('My Profile',
                  style: TextStyle(color: Colors.black, fontSize: 20)),
            )
          ],
        ),
      ),
    ),
  );
}
