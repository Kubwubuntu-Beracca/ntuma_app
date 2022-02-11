// ignore_for_file: non_constant_identifier_names, prefer_const_constructors

import 'package:delivery_app/screens/order_screen.dart';
import 'package:delivery_app/screens/profile_screen.dart';
import 'package:delivery_app/screens/setting_screen.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  Widget DrawerHeader() {
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

  Widget buildLisTile(String title, IconData icon, VoidCallback tapHandler) {
    return ListTile(
      leading: Icon(icon),
      title: Text(
        title,
        style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          DrawerHeader(),
          SizedBox(height: 20),
          buildLisTile('Home', Icons.home, () {
            Navigator.of(context).pushReplacementNamed(OrderScreen.routeName);
          }),
          buildLisTile('My Profile', Icons.person, () {
            Navigator.of(context).pushReplacementNamed(ProfileScreen.routeName);
          }),
          buildLisTile('Settings', Icons.settings, () {
            Navigator.of(context).pop();
            Navigator.of(context).pushNamed(SettingScreen.routeName);
          })
        ],
      ),
    );
  }
}
