import 'package:flutter/material.dart';
import 'package:new_contact/home/add%20screen.dart';
import 'package:new_contact/home/edit%20screen.dart';
import 'package:new_contact/home/homeScreen.dart';
import 'package:new_contact/home/spaleshscreen.dart';
void main()
{
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      '/':(context) => splashScreen(),
      'homeScreen':(context) => homeScreen(),
      'addScreen':(context) => addScreen(),
      'editScreen':(context) => editScreen(),
    },
  ),);
}