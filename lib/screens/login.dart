import 'package:flutter/material.dart';
import 'package:flutter_application_1/blocks/login_bloc.dart';
import 'package:flutter_application_1/models/user_model.dart';
import 'package:flutter_application_1/screens/home.dart';
import 'package:flutter_application_1/screens/recuperar_senha.dart';
import 'package:flutter_application_1/screens/register.dart';
import 'package:flutter_application_1/widgets/input_field.dart';
import 'package:scoped_model/scoped_model.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreen createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {

  final _userController = TextEditingController();
  final _passController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  final _loginBloc = LoginBloc();

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
            child: SafeArea (
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                color: Theme.of(context).accentColor,
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:<Widget> [
                      Container(
                        margin: EdgeInsets.only(bottom: 20),  
                        child: Text(
                          'X-BANK', 
                          style: Theme.of(context).textTheme.headline1
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
                                color: Colors.black,
                                blurRadius: 7.0,
                                offset: Offset(0, 0)
                            )
                          ],
                        ),
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          children:<Widget> [
                            InputField(
                              icon: Icons.person_outline,
                              hint: "E-mail",
                              obscure: false,
                              controller: _userController,
                              keyboardType: TextInputType.emailAddress,
                              stream: _loginBloc.outEmail,
                              onChanged: _loginBloc.changeEmail,
                            ),
                            InputField(
                              icon: Icons.lock_outline,
                              hint: "Senha",
                              obscure: true,
                              controller: _passController,
                              stream: _loginBloc.outPassword,
                              onChanged: _loginBloc.changePassword,
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
                                ),
                                onTap: (){
                                  Navigator.of(context).push(
                                    MaterialPageRoute(builder: (context)=>RecuperarSenha())
                                  );
                                  //Get.to(RecuperarSenha());
                                } 
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 10),
                              child: StreamBuilder<bool>(
                                stream: _loginBloc.outSubmitValid,
                                builder: (context, snapshot) {
                                  return  SizedBox(
                                    height: 50,
                                    width: MediaQuery.of(context).size.width,
                                    child: ElevatedButton(
                                      child: Text("Entrar"),
                                      onPressed: snapshot.hasData ? (){ 
                                        UserModel().signIn(
                                          email: _userController.text,
                                          pass: _passController.text, 
                                          onSuccess: _onSuccess, 
                                          onFail: _onFail
                                        );
                                      } : null
                                    ),
                                  );
                                }
                              )
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
                                  Navigator.of(context).push(
                                    MaterialPageRoute(builder: (context)=>Register())
                                  );
                                  //Get.to(Register());
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
        }
      )
    );
  }

  void _onSuccess(){
    Future.delayed(Duration(seconds: 2)).then((_) => 
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context)=>Home())
      )
    );
    //Get.to(Home());
  }

  void _onFail(){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Usuario/senha incorreta!"),
        backgroundColor: Colors.redAccent,
        duration: Duration(seconds: 2),
      )
    );
  }
}
