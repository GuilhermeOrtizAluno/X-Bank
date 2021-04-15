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
      body:  SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Theme.of(context).accentColor,
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
                        color: Colors.grey,
                        blurRadius: 4.0,
                        offset: Offset(0.0, 0.75))
                  ],
                ),
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: <Widget>[
                    InputField(
                      hint: "Codigo de Barras",
                      obscure: false,
                      //controller: _userController,
                      //error: "Usuario invalido!",
                    ),
                    InputField(
                      hint: "Senha",
                      obscure: false,
                      //controller: _userController,
                      //error: "Usuario invalido!",
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child:  SizedBox(
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton(
                          child: Text("Confimrar"),
                          onPressed:  (){ 
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
                                        Navigator.pushReplacement(context, 
                                          MaterialPageRoute(builder: (context) => Home())
                                        );
                                      },
                                      child: const Text("Ok"),
                                    ),
                                  ],
                                );
                              },
                            );
                          }
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}
