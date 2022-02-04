// ignore_for_file: prefer_typing_uninitialized_variables, prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_brace_in_string_interps, use_key_in_widget_constructors, must_be_immutable, avoid_unnecessary_containers, prefer_const_constructors_in_immutables, unnecessary_string_interpolations, sized_box_for_whitespace

import 'package:flutter/material.dart';

class OrderCardWidget extends StatelessWidget {
  final String typOrder;
  final String date;
  final String photo;
  final String name;
  final String address;
  final String tel;

  OrderCardWidget(
      this.typOrder, this.date, this.photo, this.name, this.address, this.tel);
  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.all(20),
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Container(
          margin: EdgeInsets.all(15),
          child: Column(children: [
            ListTile(
              title: Text(
                '$typOrder',
                style: TextStyle(color: Colors.green),
              ),
              subtitle: Text('$date'),
              trailing: ElevatedButton(
                onPressed: () {},
                child: Text('Details'),
              ),
            ),
            ListTile(
              leading: CircleAvatar(
                radius: 30,
                child: Image.asset('$photo'),
              ),
              title: Text(
                '$name',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              subtitle: FittedBox(child: Text('${address}\n${tel}')),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                    width: 120,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'Cancel',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          side: BorderSide(width: 1, color: Colors.black45),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(17),
                          )),
                    )),
                Container(
                    width: 120,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text('Deliver'),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.red,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(17))),
                    )),
                SizedBox(
                  height: 20,
                )
              ],
            )
          ]),
        ));
  }
}
