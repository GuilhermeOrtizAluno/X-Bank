import 'package:ba/models/corrente.dart';
import 'package:ba/models/poupanca.dart';
import 'package:ba/controllers/historico.dart';
import 'package:ba/models/transacao.dart';
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
  var conta;

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
        title: Text("Saldo e Extrato"),
      ),
      body: ListView.separated(
        itemCount: historico.historico.length,
        itemBuilder: (BuildContext contexto, int i) {
          final List<Transacoes> transacoes = historico.historico;
          return ListTile(
            leading: Text(transacoes[i].motivo),
            trailing: Text(transacoes[i].valor.toString()),
          );
        },
        separatorBuilder: (_, __) => Divider(),
        padding: EdgeInsets.all(15),
      ),
    );
  }
}
