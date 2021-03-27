import 'package:ba/classe/saldoeextrato/conta/corrente.dart';
import 'package:ba/classe/saldoeextrato/conta/poupanca.dart';
import 'package:ba/classe/saldoeextrato/historicotransacao/historico.dart';
import 'package:ba/classe/saldoeextrato/historicotransacao/transacao.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'conta/conta.dart';
import 'historicotransacao/historico.dart';
import 'conta/conta.dart';
import 'conta/repositorio.dart';

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
