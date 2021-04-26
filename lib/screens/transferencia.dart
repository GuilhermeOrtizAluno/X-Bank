import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/input_field.dart';
import '../database/dbfirebase.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Transferencia extends StatefulWidget {
  Transferencia({Key key}) : super(key: key);

  //Firestore.inst 0.12.9 brother 2019 ance.colletion('transferencias').document().setData({'nome': 'nome', 'cpf':'cpf', 'conta':'conta', 'agencia':'agencia', 'tipo': 'tipo'});
  @override
  _TransferenciaState createState() => _TransferenciaState();
}

class _TransferenciaState extends State<Transferencia> {
  final _nome = TextEditingController();
  final _cpf = TextEditingController();
  final _conta = TextEditingController();
  final _agencia = TextEditingController();
  final _tipo = TextEditingController();
  final _valor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Align(
            alignment: Alignment.centerRight, child: Text("Transferência")),
        elevation: 0,
      ),
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Theme.of(context).accentColor,
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
                        InputField(
                          hint: "Nome Completo",
                          obscure: false,
                          controller: _nome,
                        ),
                        InputField(
                          hint: "CPF/CNPJ",
                          obscure: false,
                          controller: _cpf,
                        ),
                        InputField(
                          hint: "Conta",
                          obscure: false,
                          controller: _conta,
                        ),
                        InputField(
                          hint: "Agência",
                          obscure: false,
                          controller: _agencia,
                        ),
                        InputField(
                          hint: "Tipo",
                          obscure: false,
                          controller: _tipo,
                        ),
                        InputField(
                          hint: "Valor",
                          obscure: false,
                          controller: _valor,
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
                                onPressed: () {
                                  createRecord();
                                },
                              ),
                            );
                          }),
                        ),
                      ],
                    ),
                  )
                ]),
          ),
        ),
      ),
    );
  }

  void createRecord() async {
    Firestore db = await DBfire.get();
    var docRef = await db.collection('titulos').add(
      {
        'nome': _nome.text,
        'cpf': _cpf.text,
        'conta': _conta.text,
        'agencia': _agencia.text,
        'tipo': _tipo.text,
        'valor': _valor.text,
      },
    );
  }
}
