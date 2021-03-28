<<<<<<< HEAD
import 'package:flutter/material.dart';
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
=======
import 'package:ba/screens/paga.dart';
import 'package:flutter/cupertino.dart';
import 'package:ba/screens/Menu.dart';
import 'package:ba/repositories/historico_repositorio.dart';
import 'package:ba/screens/saldo_extrato.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(BankX());
}

class BankX extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Bank X',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      home: Menu(),
>>>>>>> origin/Nicholas
    );
  }
}
