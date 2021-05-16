import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/blocks/transfer_bloc.dart';
import 'package:flutter_application_1/models/user_model.dart';
import 'package:scoped_model/scoped_model.dart';
import '../widgets/input_field.dart';
import 'home.dart';

class Pix extends StatefulWidget {
  Pix({Key key}) : super(key: key);

  @override
  _PixState createState() => _PixState();
}

class _PixState extends State<Pix> {

  final _cpf = TextEditingController();
  final _valor = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _transferBloc = TransferBloc();

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
      body: ScopedModelDescendant<UserModel>(
        builder: (context, child, model){
        if(model.isLoading)
          return Center(child: CircularProgressIndicator());  
          return SafeArea(
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
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            InputField(
                              hint: "CPF",
                              obscure: false,
                              controller: _cpf,
                              stream: _transferBloc.outCPF,
                              onChanged: _transferBloc.changeCPF,
                              keyboardType: TextInputType.number,
                            ),
                              InputField(
                              hint: "Valor",
                              obscure: false,
                              controller: _valor,
                              stream: _transferBloc.outValor,
                              onChanged: _transferBloc.changeValor,
                              keyboardType: TextInputType.number,
                            ),
                            Container(
                              //Botão enviar transferencia
                              margin: EdgeInsets.symmetric(vertical: 5),
                              child: StreamBuilder<bool>(
                                builder: (context, snapshot) {
                                  return SizedBox(
                                    height: 50,
                                    width: MediaQuery.of(context).size.width,
                                    child: ElevatedButton(
                                      child: Text("Transferir"),
                                      onPressed: _cpf != null && _valor != null ? () {
                                        if (verificaSaldo(model, double.tryParse(_valor.text)))
                                          UserModel().transfer(
                                            id: model.id,
                                            cpf:  int.tryParse(_cpf.text),
                                            dCorrente: true,
                                            oCorrente: true,
                                            valor: double.tryParse(_valor.text),
                                            onSuccess: _onSuccess, 
                                            onFail: _onFail
                                          );
                                        else _saldo();
                                      } : null,
                                    ),
                                  );
                              }),
                            ),
                          ],
                        ),
                      ),
                    )
                  ]
                ),
              ),
            ),
          );
        }
      ),
    );
  }
  
  void _onSuccess(){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Transferencia com sucesso!"),
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
      SnackBar(content: Text("Algo deu errado, tente novmente!"),
        backgroundColor: Colors.redAccent,
        duration: Duration(seconds: 2),
      )
    );
  }

  void _saldo(){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Saldo Insuficiente!"),
        backgroundColor: Colors.redAccent,
        duration: Duration(seconds: 2),
      )
    );
  }

}

bool verificaSaldo(UserModel model, double valor){
  return model.userData['currentBalance'] > valor;
}
