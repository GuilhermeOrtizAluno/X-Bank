import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/input_field.dart';

import 'home.dart';

class Pay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Align(
            alignment: Alignment.centerRight,
            child: Text("Pagar Conta"),
          ),
          elevation: 0,
        ),
        body: SafeArea(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Color.fromRGBO(0, 80, 255, 1),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 40),
                  decoration: BoxDecoration(
                    //quadrado branco
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18.0),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: Colors.white,
                          blurRadius: 4.0,
                          offset: Offset(0.0, 0.75))
                    ],
                  ),
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    children: <Widget>[
                      Text('Digite o Codigo de Barras',
                          style: TextStyle(color: Colors.black)),
                      InputField(
                        hint: "Codigo de Barras",
                        obscure: false,
                        //controller: _userController,
                        //error: "Usuario invalido!",
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        child: SizedBox(
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          child: ElevatedButton(
                              child: Text("Confimrar"),
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text(
                                          "Valor da Conta RS 1000,00\nDigite a senha"),
                                      content: InputField(
                                        hint: "Senha",
                                        obscure: true,
                                        //controller: _userController,
                                        //error: "Usuario invalido!",
                                      ),
                                      actions: <Widget>[
                                        ElevatedButton(
                                          onPressed: () {
                                            showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  title: Text("Obrigado"),
                                                  content: Text(
                                                      "Conta paga com Sucesso"),
                                                  actions: <Widget>[
                                                    ElevatedButton(
                                                      onPressed: () {
                                                        Navigator.pushReplacement(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        Home()));
                                                      },
                                                      child: const Text("Ok"),
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                          },
                                          child: const Text("Ok"),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              }),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
