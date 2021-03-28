import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/user_model.dart';
import 'package:flutter_application_1/screens/home.dart';
import 'package:flutter_application_1/screens/register.dart';
import 'package:flutter_application_1/widgets/input_field.dart';
import 'package:scoped_model/scoped_model.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreen createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {

  final _emailController = TextEditingController();
  final _passController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

   void _onSuccess(){
    Navigator.of(context).pop();
    // Navigator.push(context, 
    //   MaterialPageRoute(builder: (context) => Home())
    // );
  }

  void _onFail(){
    _scaffoldKey.currentState.showSnackBar(
        SnackBar(content: Text("Falha ao Entrar!"),
          backgroundColor: Colors.redAccent,
          duration: Duration(seconds: 2),
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: ScopedModelDescendant<UserModel>(
        builder: (context, child, model){
          if(model.isLoading)
            return Center(child: CircularProgressIndicator());
          return Form(
            key: _formKey,
            child: SingleChildScrollView (
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
                              icon: Icons.person_outline,
                              hint: "Usuário",
                              obscure: false,
                              controller: _emailController,
                              error: "Usuario invalido!",
                            ),
                            InputField(
                              icon: Icons.lock_outline,
                              hint: "Senha",
                              obscure: true,
                              controller: _passController,
                              error: "Senha invaloda!",
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 5),
                              child: InkWell(
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    'Esqueceu a Senha?',
                                    style: TextStyle(
                                      color: Colors.red,
                                    ),
                                  ),
                                )
                                //onTap: 
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 5),
                              child: StreamBuilder<bool>(
                                
                                //stream: _loginBloc.outSubmitValid,
                                builder: (context, snapshot) {
                                  return SizedBox(
                                    height: 50,
                                    width: MediaQuery.of(context).size.width,
                                    child: RaisedButton(
                                      color: Colors.pinkAccent,
                                      child: Text("Entrar"),
                                      textColor: Colors.white,
                                      onPressed:  (){ 
                                        model.signIn(
                                          email: _emailController.text, 
                                          pass: _passController.text, 
                                          onSuccess: _onSuccess, 
                                          onFail: _onFail);
                                      }
                                    ),
                                  );
                                }
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 5),
                              child: InkWell(
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    'Cadastrar-se',
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                onTap: (){ 
                                  Navigator.push(context, 
                                    MaterialPageRoute(builder: (context) => Register())
                                  );
                                }
                              )
                            )
                          ]
                        )
                      )
                    ]
                  )
                )
              )
            )
          );
        },
      )
    );
  }
}
