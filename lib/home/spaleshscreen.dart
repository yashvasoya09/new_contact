import 'dart:async';

import 'package:flutter/material.dart';

class splashScreen extends StatefulWidget {
  const splashScreen({Key? key}) : super(key: key);

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  @override
  Widget build(BuildContext context) {

    Timer(Duration(seconds: 3),() {
      Navigator.pushReplacementNamed(context, 'homeScreen');
    },);
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Image.asset("assets/images/logo.png"),
        ),
      ),
    );
  }
}