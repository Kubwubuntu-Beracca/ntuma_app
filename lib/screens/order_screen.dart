// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, prefer_typing_uninitialized_variables, unused_local_variable, unused_field

import 'package:delivery_app/data/order_info.dart';
import 'package:delivery_app/widgets/main_drawer.dart';
import 'package:delivery_app/widgets/order_card.dart';
import 'package:flutter/material.dart';

class OrderScreen extends StatefulWidget {
  static const routeName = '/oders';
  const OrderScreen({Key? key}) : super(key: key);

  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.red),
            backgroundColor: Colors.white,
            title: Text(
              'Deliverzier',
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.red, fontSize: 20),
            )),
        drawer: MainDrawer(),
        body: ListView.separated(
            itemBuilder: (BuildContext context, index) {
              return Container(
                  child: OrderCardWidget(
                ORDER_DATA[index].typeOfOrder,
                ORDER_DATA[index].date,
                ORDER_DATA[index].photo,
                ORDER_DATA[index].name,
                ORDER_DATA[index].address,
                ORDER_DATA[index].tel,
              ));
            },
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(),
            itemCount: (ORDER_DATA.length)));
  }
}
