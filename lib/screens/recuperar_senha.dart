import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/input_field.dart';

class RecuperarSenha extends StatefulWidget {
  RecuperarSenha({Key key}) : super(key: key);

  @override
  _RecuperarSenhaState createState() => _RecuperarSenhaState();
}

class _RecuperarSenhaState extends State<RecuperarSenha> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Align(
          alignment: Alignment.centerRight,
          child: Text("Recuperar Senha"),
        ),
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
                Text(
                  "X-Bank",
                  style: Theme.of(context).textTheme.headline1,
                ),
                SizedBox(height: 30),
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18.0),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 4.0,
                        offset: Offset(0.0, 0.75)
                      )
                    ],
                  ),
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    children: <Widget>[
                      InputField(
                          hint: "Email",
                          obscure: false,
                          //controller: _passController,
                          //error: "Senha invaloda!",
                        ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 5),
                        child: StreamBuilder<bool>(
                          builder: (context, snapshot) {
                            return SizedBox(
                              height: 50,
                              width: MediaQuery.of(context).size.width,
                              child: ElevatedButton(
                                child: Text("Recuperar"),
                                onPressed:  (){}
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
      ),
    );
  }
}
