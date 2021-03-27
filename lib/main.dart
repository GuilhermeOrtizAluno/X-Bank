import 'package:flutter/cupertino.dart';
import 'package:ba/classe/Menu.dart';
import 'package:ba/classe/saldoeextrato/historicotransacao/repositorio.dart';
import 'package:ba/classe/saldoeextrato/saldo_extrato.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(BankX());
}

class BankX extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bank X',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      home: Menu(),
    );
  }
}
