import 'package:ba/screens/paga.dart';
import 'package:ba/controllers/historico.dart';
import 'package:ba/models/transacao.dart';
import 'package:ba/screens/saldo_extrato.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  var historico;

  @override
  void initState() {
    super.initState();
    historico = Historico();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          title: Text("BANK X"),
        ),
        body: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(8),
              child: ElevatedButton(
                onPressed: () {
                  Get.to(() => Saldo());
                },
                child: Text("Saldo"),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              child: ElevatedButton(
                onPressed: () {
                  Get.to(() => Paga());
                },
                child: Text("Pagar"),
              ),
            ),
          ],
        ));
  }
}
