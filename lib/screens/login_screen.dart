// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, sized_box_for_whitespace, prefer_const_literals_to_create_immutables, unnecessary_import, implementation_imports

import 'package:delivery_app/screens/order_screen.dart';
import 'package:delivery_app/widgets/background_image.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var _email, _password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  void goTohomeScreen(BuildContext ctx) {}

  @override
  Widget build(BuildContext context) {
    Future<void> logIn() async {
      final formState = _formKey.currentState;
      if (formState!.validate()) {
        formState.save();
        try {
          UserCredential user = await FirebaseAuth.instance
              .signInWithEmailAndPassword(email: _email, password: _password);
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const OrderScreen()));
        } catch (e) {
          print(e);
        }
      }
    }

    return Stack(
      children: [
        Stack(children: [
          Container(
            color: Colors.white,
          ),
          BackGroundImages(
              images: 'assets/images/login_page_icons/login_background.png')
        ]),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(children: [
              SizedBox(
                  height: ((MediaQuery.of(context).size.height -
                          MediaQuery.of(context).padding.top) *
                      0.06)),
              Center(
                child: FittedBox(
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                              'assets/images/login_page_icons/icon.png'),
                          fit: BoxFit.fill),
                    ),
                  ),
                ),
              ),
              Text(
                'Delivery',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),

              //welcome and text field properties
              Container(
                margin: EdgeInsets.all(40),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'Welcome',
                          style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                              fontSize: 24),
                        ),
                        FittedBox(
                            child: Container(
                                height: 40,
                                width: 40,
                                child: Image.asset(
                                    'assets/images/login_page_icons/hi_hand.png'))),
                      ],
                    ),
                    Text(
                      'Sign in into your account',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black45),
                    ),
                    SizedBox(
                        height: ((MediaQuery.of(context).size.height -
                                MediaQuery.of(context).padding.top) *
                            0.05)),
                    Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            TextFormField(
                              validator: (input) {
                                if (input!.isEmpty) {
                                  return 'please type an email';
                                }
                              },
                              onSaved: (input) => _email = input,
                              decoration: InputDecoration(
                                  suffixIcon: Icon(
                                    Icons.email,
                                    color: Color(0xff9b9b9b),
                                  ),
                                  hintText: 'Email',
                                  hintStyle: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black26,
                                  ),
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                      borderSide: BorderSide(
                                          color: Colors.black45, width: 1))),
                            ),
                            SizedBox(
                                height: ((MediaQuery.of(context).size.height -
                                        MediaQuery.of(context).padding.top) *
                                    0.04)),
                            TextFormField(
                              validator: (input) {
                                if (input!.length < 6) {
                                  return 'Your password needs to be at least 6 characters';
                                }
                              },
                              onSaved: (input) => _password = input,
                              obscureText: true,
                              decoration: InputDecoration(
                                  suffixIcon: Icon(
                                    Icons.password,
                                    color: Color(0xff9b9b9b),
                                  ),
                                  hintText: 'Password',
                                  hintStyle: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black26),
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                      borderSide: BorderSide(
                                          color: Colors.black45, width: 1))),
                            ),
                          ],
                        )),
                    SizedBox(
                        height: ((MediaQuery.of(context).size.height -
                                MediaQuery.of(context).padding.top) *
                            0.05)),
                    Container(
                      width: 270,
                      height: 50,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.red,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0))),
                          onPressed: logIn,
                          child: Text(
                            'SIGN IN',
                            style: TextStyle(fontSize: 20),
                          )),
                    )
                  ],
                ),
              ),
            ]),
          ),
        )
      ],
    );
  }
}
