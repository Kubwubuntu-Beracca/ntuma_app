// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, sized_box_for_whitespace, unnecessary_string_interpolations, unnecessary_brace_in_string_interps

import 'package:flutter/material.dart';

class BackGroundImages extends StatelessWidget {
  final String images;

  BackGroundImages({required this.images});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Image.asset("${images}", fit: BoxFit.cover),
    );
  }
}
