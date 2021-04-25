import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/blocks/register_bloc.dart';
import 'package:flutter_application_1/models/user_model.dart';
import 'package:flutter_application_1/screens/home.dart';
import 'package:flutter_application_1/widgets/input_field.dart';
import 'package:scoped_model/scoped_model.dart';

class Register extends StatefulWidget {
  @override
  _Register createState() => _Register();
}

class _Register extends State<Register> {

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  final _registerBloc = RegisterBloc();

  var random = new Random();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Align(
          alignment: Alignment.centerRight,
          child: Text("Cadastro"),
        ),
        elevation: 0,
      ),
      body: ScopedModelDescendant<UserModel>(
        builder: (context, child, model){
          if(model.isLoading)
            return Center(child: CircularProgressIndicator());  
          return Form (
            key: _formKey,
            child: SafeArea(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                color: Theme.of(context).accentColor,
                child: Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:<Widget> [
                        Container(
                          margin: EdgeInsets.only(bottom: 20),  
                          child: Text(
                            'X-BANK', 
                            style: Theme.of(context).textTheme.headline1,
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
                                controller: _nameController,
                                hint: "Nome Completo",
                                obscure: false,
                                onChanged: _registerBloc.changeName,
                                stream: _registerBloc.outName,
                              ),
                              InputField(
                                controller: _emailController,
                                hint: "E-mail",
                                obscure: false,
                                keyboardType: TextInputType.emailAddress,
                                stream: _registerBloc.outEmail,
                                onChanged: _registerBloc.changeEmail,
                              ),
                              // InputField(
                              //   hint: "Usuário",
                              //   error: "Usuario invalido!",
                              //   obscure: false,
                              // ),
                              InputField(
                                controller: _senhaController,
                                hint: "Senha",
                                obscure: true,
                                stream: _registerBloc.outPassword,
                                onChanged: _registerBloc.changePassword,
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 25, bottom: 5),
                                child: StreamBuilder<bool>(
                                  stream: _registerBloc.outSubmitValid,
                                  builder: (context, snapshot) {
                                    return SizedBox(
                                      height: 50,
                                      width: MediaQuery.of(context).size.width,
                                      child: ElevatedButton(
                                        child: Text("Cadastrar-se"),
                                        onPressed: snapshot.hasData ? (){
                                          Map<String, dynamic> userData = {
                                            "name": _nameController.text,
                                            "email": _emailController.text,
                                            "currentBalance": random.nextInt(1000000), 
                                            "savingsBalance": random.nextInt(1000000)
                                          };
                                          model.signUp(
                                            userData: userData, 
                                            pass: _senhaController.text, 
                                            onSuccess: _onSuccess, 
                                            onFail: _onFail
                                          );
                                        } : null
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
                  ),
                )
              ),
            )
          );
        }
      )
    );
  }

   void _onSuccess(){
     ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Usuario criado com sucesso"),
        backgroundColor: Colors.greenAccent,
        duration: Duration(seconds: 2),
      )
    );
    Future.delayed(Duration(seconds: 2)).then((_) => 
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context)=>Home())
      )
    );
    //Get.to(Home());
  }

  void _onFail(){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Ops algo deu errado, tente novamente!"),
        backgroundColor: Colors.redAccent,
        duration: Duration(seconds: 2),
      )
    );
  }

}
