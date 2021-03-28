import 'package:ba/input_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Menu.dart';

class Paga extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(52, 20, 250, 1),
        foregroundColor: Color.fromRGBO(52, 20, 250, 1),
        elevation: 0,
      ),
      body: Scaffold(
          body: Container(
              //Background azul ?
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Color.fromRGBO(52, 20, 250, 1),
              child: Center(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "X-Bank",
                        style: TextStyle(fontSize: 60),
                      ),
                      SizedBox(height: 30),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 24),
                        decoration: BoxDecoration(
                          //quadrado branco
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(18.0),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                                color: Colors.grey,
                                blurRadius: 4.0,
                                offset: Offset(0.0, 0.75))
                          ],
                        ),
                        padding: EdgeInsets.all(5.0),
                        child: Column(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(top: 10, bottom: 5),
                              color: Color.fromRGBO(229, 229, 229, 1),
                              child: InputField(
                                hint: "Codigo de Barras",
                                obscure: false,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 10, bottom: 5),
                              color: Color.fromRGBO(229, 229, 229, 1),
                              child: InputField(
                                hint: "Senha",
                                obscure: true,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 5),
                              child: StreamBuilder<bool>(
                                  builder: (context, snapshot) {
                                return SizedBox(
                                  height: 50,
                                  width: MediaQuery.of(context).size.width,
                                  child: RaisedButton(
                                      color: Colors.blue,
                                      child: Text("Confirmar"),
                                      onPressed: () {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: const Text("Obrigado"),
                                              content: Text(
                                                  "Conta paga com Sucesso"),
                                              actions: <Widget>[
                                                ElevatedButton(
                                                  onPressed: () {
                                                    Get.to(() => Menu());
                                                  },
                                                  child: const Text("Ok"),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      },
                                      textColor: Colors.white,
                                      disabledColor: Colors.grey),
                                );
                              }),
                            ),
                          ],
                        ),
                      )
                    ]),
              ))),
    );
  }
}
