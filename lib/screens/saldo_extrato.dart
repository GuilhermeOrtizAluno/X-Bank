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
  String conteudo;

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
      appBar: AppBar(
        title: Align(
          alignment: Alignment.centerRight,
          child: Text("Saldo e Extrato"),
        ),
        elevation: 0,
      ),
      body: Container(
        child: Column(children: <Widget>[
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
                        tileColor: Color.fromRGBO(0, 80, 255, 1),
                        leading: Text(
                          transacoes[i].motivo,
                          style: TextStyle(color: Colors.white),
                        ),
                        trailing: Text(
                          transacoes[i].valor,
                          style: TextStyle(color: Colors.white),
                        ),
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                backgroundColor: Color.fromRGBO(0, 80, 255, 1),
                                title: Text(
                                  transacoes[i].motivo,
                                  style: TextStyle(color: Colors.white),
                                ),
                                content: SingleChildScrollView(
                                  child: ListBody(
                                    children: <Widget>[
                                      Text(
                                        "Valor: ",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      Text(
                                        transacoes[i].valor,
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      Text(
                                        "\nTipo de transação: ",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      Text(
                                        transacoes[i].tipo,
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      Text(
                                        "\nPessoa : ",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      Text(
                                        transacoes[i].pessoa,
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      Text(
                                        "\nTipo da sua conta: ",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      Text(
                                        transacoes[i].conta1,
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      Text(
                                        "\nTipo da conta transferida: ",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      Text(
                                        transacoes[i].conta2,
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                                actions: <Widget>[
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Saldo()));
                                    },
                                    child: const Text("Ok"),
                                  ),
                                ],
                              );
                            },
                          );
                        });
                  },
                  separatorBuilder: (_, __) => Divider(),
                  padding: EdgeInsets.all(15),
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
