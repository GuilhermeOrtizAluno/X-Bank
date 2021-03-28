import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/corrente.dart';
import 'package:flutter_application_1/models/poupanca.dart';
import 'package:flutter_application_1/models/transacao.dart';
import '../controllers/conta.dart';
import '../controllers/historico.dart';
import '../widgets/balance.dart';

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
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Balance(),
            Column(
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
          ]
        ),
      ),
    );
  }
}
