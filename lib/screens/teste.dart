import 'package:ba/input_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Teste extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text("Pagar"),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 24),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Card(
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    TextField(
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Digite o Codigo de Barras',
                      ),
                      onSubmitted: (String value) async {
                        await showDialog<void>(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Digite sua Senha'),
                              content: TextField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Digite sua Senha',
                                ),
                                onSubmitted: (String value) async {
                                  await showDialog<void>(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: const Text("Obrigado"),
                                        content: Text("Conta paga com Sucesso"),
                                        actions: <Widget>[
                                          ElevatedButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: const Text("Ok"),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                              ),
                              actions: <Widget>[
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text('Confirmar'),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text('Sair'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
              Container(
                child: StreamBuilder<bool>(builder: (context, snapshot) {
                  return SizedBox(
                    height: 50,
                    width: 100,
                    child: RaisedButton(
                        color: Colors.pinkAccent,
                        child: Text("Confirmar"),
                        onPressed: () {},
                        textColor: Colors.white,
                        disabledColor: Colors.grey),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
