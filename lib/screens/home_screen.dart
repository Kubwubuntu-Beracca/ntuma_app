// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'package:delivery_app/data/order_info.dart';
import 'package:delivery_app/widgets/menu/my_drawer_header.dart';
import 'package:delivery_app/widgets/menu/my_drawer_list.dart';
import 'package:delivery_app/widgets/order_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  get address => null;

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
        drawer: Drawer(
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  MyHeaderDraweWidget(),
                  MyDrawerListWidget(),
                ],
              ),
            ),
          ),
        ),
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
