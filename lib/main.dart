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
    );
  }
}
