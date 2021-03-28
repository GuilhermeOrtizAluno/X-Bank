import 'package:ba/models/corrente.dart';
import 'package:ba/models/poupanca.dart';
import 'package:ba/controllers/historico.dart';
import 'package:ba/models/transacao.dart';
import 'package:ba/input_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
  var conta;
  double valorcorrente;
  double valorpoupanca;
  double valorc;
  double valorp;

  @override
  void initState() {
    super.initState();
    historico = Historico();
    conta = Conta();
  }

  @override
  Widget build(BuildContext context) {
    List<Corrente> valorcorrente = conta.contacorrente;
    List<Poupanca> valorpoupanca = conta.contapoupanca;
    valorc = valorcorrente[0].valorcorrente;
    valorp = valorpoupanca[0].valorpoupanca;

    return Scaffold(
      backgroundColor: Color.fromRGBO(52, 20, 250, 1),
      appBar: AppBar(
        title: Text("Saldo e Extrato"),
        bottom: PreferredSize(
          child: Container(
            alignment: Alignment.centerLeft,
            color: Colors.white,
            constraints: BoxConstraints.expand(height: 50),
            child: Text(
              "Saldo Conta Corrente:               Saldo Conta Poupança:\n   RS  $valorc                                           RS  $valorp",
              style: TextStyle(fontSize: 15),
            ),
          ),
          preferredSize: Size(50, 50),
        ),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
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
