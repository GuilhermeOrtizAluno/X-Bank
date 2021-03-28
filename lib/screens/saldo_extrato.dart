import 'dart:html';

import 'package:ba/models/corrente.dart';
import 'package:ba/models/poupanca.dart';
import 'package:ba/controllers/historico.dart';
import 'package:ba/models/transacao.dart';
import 'package:ba/widgets/input_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../controllers/conta.dart';
import '../controllers/historico.dart';
import '../controllers/conta.dart';
import '../repositories/conta_repositorio.dart';

class Saldo extends StatefulWidget {
  Saldo({Key key}) : super(key: key);

  @override
  _SaldoState createState() => _SaldoState();
}

class _SaldoState extends State<Saldo> {
  var historico;
  double corrente = 1000.50;

  @override
  void initState() {
    super.initState();
    historico = Historico();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(52, 20, 250, 1),
      appBar: AppBar(
        title: Text("Saldo e Extrato"),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              Container(
                child: Text("Saldo Conta Corrente", textScaleFactor: corrente),
              ),
              Container(
                child: Text("Saldo Conta Corrente"),
              ),
              Container(
                child: Text("Saldo Conta Poupança"),
              ),
              Container(
                width: 500,
                height: 500,
                child: ListView.separated(
                  itemCount: historico.historico.length,
                  itemBuilder: (BuildContext contexto, int i) {
                    final List<Transacoes> transacoes = historico.historico;
                    return ListTile(
                      tileColor: Colors.white,
                      leading: Text(transacoes[i].motivo),
                      trailing: Text(transacoes[i].valor.toString()),
                    );
                  },
                  separatorBuilder: (_, __) => Divider(),
                  padding: EdgeInsets.all(15),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
