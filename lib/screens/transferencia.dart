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
        title: Align(
          alignment: Alignment.centerRight,
          child: Text("Transferência")
        ),
        elevation: 0,
      ),
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Theme.of(context).accentColor,
          child:  Center(
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
                      InputField(
                        hint: "Nome Completo",
                        obscure: false,
                      ),
                      InputField(
                        hint: "CPF/CNPJ",
                        obscure: false,
                      ),
                      InputField(
                        hint: "Conta",
                        obscure: false,
                      ),
                      InputField(
                        hint: "Agência",
                        obscure: false,
                      ),
                      InputField(
                        hint: "Tipo",
                        obscure: false,
                      ),
                        InputField(
                        hint: "Valor",
                        obscure: false,
                      ),
                      
                      Container(
                        //Botão enviar transferencia
                        margin: EdgeInsets.symmetric(vertical: 5),
                        child:
                            StreamBuilder<bool>(builder: (context, snapshot) {
                          return SizedBox(
                            height: 50,
                            width: MediaQuery.of(context).size.width,
                            child: ElevatedButton(
                              child: Text("Enviar"),
                              onPressed: () {},
                            ),
                          );
                        }),
                      ),
                    ],
                  ),
                )
              ]
            ),
          ),
        ),
      ),
    );
  }
}
