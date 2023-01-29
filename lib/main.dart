import 'package:atulya_app/Authentication/Signup.dart';
import 'package:atulya_app/Authentication/Start.dart';
import 'package:atulya_app/Authentication/forgot.dart';
import 'package:atulya_app/Splash.dart';
import 'package:atulya_app/pages/Home.dart';
import 'package:atulya_app/pages/cart.dart';
import 'package:atulya_app/pages/search_mode.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'Authentication/Login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseFirestore.instance;
  await SharedPreferences.getInstance();

  await FirebaseAppCheck.instance
      .activate(webRecaptchaSiteKey: '97AAE9E4-6D49-44A2-8633-FB6A49B8A009');

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Splash(),
    routes: <String, WidgetBuilder>{
      "Login": (BuildContext context) => Login(),
      "SignUp": (BuildContext context) => SignUp(),
      "start": (BuildContext context) => Start(),
      "main": (BuildContext context) => Home(),
      "mode": (BuildContext context) => Smode(),
      "carti": (BuildContext context) => Cart(),
      "forgot": (BuildContext context) => Forgot(),
    },
    //home: Home(),
  ));
}
