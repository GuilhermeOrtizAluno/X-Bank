import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/home.dart';
import 'package:flutter_application_1/widgets/input_field.dart';

class Register extends StatefulWidget {
  @override
  _Register createState() => _Register();
}

class _Register extends State<Register> {

/*final _loginBloc = LoginBloc();

  @override
  void initState() {
    super.initState();

    _loginBloc.outState.listen((state){
      switch(state){
        case LoginState.SUCCESS:
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context)=>HomeScreen())
          );
          break;
        case LoginState.FAIL:
          showDialog(context: context, builder: (context)=>AlertDialog(
            title: Text("Erro"),
            content: Text("Você não possui os privilégios necessários"),
          ));
          break;
        case LoginState.LOADING:
        case LoginState.IDLE:
      }
    });
  }

  @override
  void dispose() {
    _loginBloc.dispose();
    super.dispose();
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView (
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
                      //stream: _loginBloc.outEmail,
                      //onChanged: _loginBloc.changeEmail,
                    ),
                    InputField(
                      hint: "E-mail",
                      obscure: false,
                      //stream: _loginBloc.outEmail,
                      //onChanged: _loginBloc.changeEmail,
                    ),
                    InputField(
                      hint: "Usuário",
                      obscure: false,
                      //stream: _loginBloc.outEmail,
                      //onChanged: _loginBloc.changeEmail,
                    ),
                    InputField(
                      hint: "Senha",
                      obscure: true,
                      //stream: _loginBloc.outPassword,
                      //onChanged: _loginBloc.changePassword,
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
                              child: Text("Cadastrar-se"),
                              onPressed:  (){ 
                                Navigator.push(context, 
                                  MaterialPageRoute(builder: (context) => Home())
                                );//snapshot.hasData ? _loginBloc.submit : null,
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
