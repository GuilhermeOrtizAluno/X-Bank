import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/home.dart';
import 'package:flutter_application_1/widgets/input_field.dart';

class Register extends StatefulWidget {
  @override
  _Register createState() => _Register();
}

class _Register extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea (
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Color.fromRGBO(52, 20, 250, 1),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children:<Widget> [
              Container(
                margin: EdgeInsets.only(bottom: 20),  
                child: Text(
                  'X-BANK', 
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 35
                  )
                ),
              ),
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
                        offset: Offset(0.0, 0.75)
                    )
                  ],
                ),
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children:<Widget> [
                    InputField(
                      hint: "Nome Completo",
                      obscure: false,
                    ),
                    InputField(
                      hint: "E-mail",
                      obscure: false,
                    ),
                    InputField(
                      hint: "Usuário",
                      obscure: false,
                    ),
                    InputField(
                      hint: "Senha",
                      obscure: true,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 5),
                      child: StreamBuilder<bool>(
                        builder: (context, snapshot) {
                          return SizedBox(
                            height: 50,
                            width: MediaQuery.of(context).size.width,
                            child: RaisedButton(
                              color: Colors.pinkAccent,
                              child: Text("Cadastrar-se"),
                              onPressed:  (){ 
                                Navigator.push(context, 
                                  MaterialPageRoute(builder: (context) => Home())
                                );
                              },
                              textColor: Colors.white,
                              disabledColor: Colors.grey
                            ),
                          );
                        }
                      ),
                    ),
                  ],
                ),
              )
            ]
          ),
        )
      )
    ));
  }
}
