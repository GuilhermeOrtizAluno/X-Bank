import 'package:flutter/material.dart';
//import 'package:flutter_application_1/screens/login.dart';
import 'screens/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color.fromRGBO(52, 20, 250, 1),
        buttonColor: Color.fromRGBO(52, 20, 250, 1)
      ),
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}