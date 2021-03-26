import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/input_field.dart';

class Transferencia extends StatefulWidget {
  Transferencia({Key key}) : super(key: key);

  @override
  _TransferenciaState createState() => _TransferenciaState();
}

class _TransferenciaState extends State<Transferencia> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Transferência"),
        backgroundColor: Color.fromRGBO(52, 20, 250, 1),
        foregroundColor: Color.fromRGBO(52, 20, 250, 1),
        elevation: 0,
      ),
      body: Scaffold(
          body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Color.fromRGBO(52, 20, 250, 1),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width,
                    constraints: BoxConstraints(maxWidth: 300),
                    margin: EdgeInsets.symmetric(horizontal: 40),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18.0),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                            color: Colors.grey,
                            blurRadius: 5.0,
                            offset: Offset(0.0, 0.75))
                      ],
                    ),
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      children: <Widget>[
                        Container(
                          //Input: "Nome Completo"
                          margin: EdgeInsets.only(top: 10, bottom: 5),
                          color: Color.fromRGBO(229, 229, 229, 1),
                          child: InputField(
                            hint: "Nome Completo",
                            obscure: false,
                          ),
                        ),
                        Container(
                          //Input: "CPF/CNPJ"
                          margin: EdgeInsets.only(top: 10, bottom: 5),
                          color: Color.fromRGBO(229, 229, 229, 1),
                          child: InputField(
                            hint: "CPF/CNPJ",
                            obscure: false,
                          ),
                        ),
                        Container(
                          //Input: "Conta"
                          margin: EdgeInsets.only(top: 10, bottom: 5),
                          color: Color.fromRGBO(229, 229, 229, 1),
                          child: InputField(
                            hint: "Conta",
                            obscure: false,
                          ),
                        ),
                        Container(
                          //Input: "Agência"
                          margin: EdgeInsets.only(top: 10, bottom: 5),
                          color: Color.fromRGBO(229, 229, 229, 1),
                          child: InputField(
                            hint: "Agência",
                            obscure: false,
                          ),
                        ),
                        Container(
                          //Input: "Tipo"
                          margin: EdgeInsets.only(top: 10, bottom: 5),
                          color: Color.fromRGBO(229, 229, 229, 1),
                          child: InputField(
                            hint: "Tipo",
                            obscure: false,
                          ),
                        ),
                        Container(
                          //Input: "Valor"
                          margin: EdgeInsets.only(top: 10, bottom: 5),
                          color: Color.fromRGBO(229, 229, 229, 1),
                          child: InputField(
                            hint: "Valor",
                            obscure: false,
                          ),
                        ),
                        Container(
                          //Botão enviar transferencia
                          margin: EdgeInsets.symmetric(vertical: 5),
                          child:
                              StreamBuilder<bool>(builder: (context, snapshot) {
                            return SizedBox(
                              height: 50,
                              width: MediaQuery.of(context).size.width,
                              child: RaisedButton(
                                  color: Colors.pinkAccent,
                                  child: Text("Enviar"),
                                  onPressed: () {},
                                  textColor: Colors.white,
                                  disabledColor: Colors.grey),
                            );
                          }),
                        ),
                      ],
                    ),
                  )
                ]),
          ),
        ),
      )),
    );
  }
}
