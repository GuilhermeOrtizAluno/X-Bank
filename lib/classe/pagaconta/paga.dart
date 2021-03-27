import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Paga extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text("Pagar"),
      ),
      body: Center(
        child: Center(
          child: Column(
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
