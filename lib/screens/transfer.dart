import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/blocks/transfer_bloc.dart';
import 'package:flutter_application_1/models/user_model.dart';
import 'package:scoped_model/scoped_model.dart';
import '../widgets/input_field.dart';
import 'home.dart';

class Transferencia extends StatefulWidget {
  Transferencia({Key key}) : super(key: key);

  @override
  _TransferenciaState createState() => _TransferenciaState();
}

class _TransferenciaState extends State<Transferencia> {

  final _nomeController = TextEditingController();
  final _cpf = TextEditingController();
  final _conta = TextEditingController();
  final _agencia = TextEditingController();
  final _valor = TextEditingController();
  final _formKey1 = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
  final _transferController = PageController();
  final _transferBloc = TransferBloc();
  String _destino;
  String _origem;

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
      body: PageView(
        controller: _transferController,
        physics: NeverScrollableScrollPhysics(),
        children: <Widget>[ 
          SafeArea(
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
                        key: _formKey1,
                        child: Column(
                          children: <Widget>[
                            InputField(
                              hint: "Nome Completo",
                              obscure: false,
                              controller: _nomeController,
                              stream: _transferBloc.outNome,
                              onChanged: _transferBloc.changeNome,
                            ),
                            InputField(
                              hint: "CPF/CNPJ",
                              obscure: false,
                              controller: _cpf,
                              keyboardType: TextInputType.number,
                              stream: _transferBloc.outCPF,
                              onChanged: _transferBloc.changeCPF,
                            ),
                            InputField(
                              hint: "Conta",
                              obscure: false,
                              controller: _conta,
                              keyboardType: TextInputType.number,
                              stream: _transferBloc.outCc,
                              onChanged: _transferBloc.changeCc,
                            ),
                            InputField(
                              hint: "Agência",
                              obscure: false,
                              controller: _agencia,
                              keyboardType: TextInputType.number,
                              stream: _transferBloc.outAg,
                              onChanged: _transferBloc.changeAg,
                            ),
                            Container(
                              //Botão enviar transferencia
                              margin: EdgeInsets.symmetric(vertical: 5),
                              child: StreamBuilder<bool>(
                                  stream: _transferBloc.outSubmitValid,
                                  builder:(context, snapshot) {
                                  return SizedBox(
                                    height: 50,
                                    width: MediaQuery.of(context).size.width,
                                    child: ElevatedButton(
                                      child: Text("Avançar"),
                                      onPressed: snapshot.hasData ? () {
                                        _transferController.jumpToPage(1);
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
          ),
          ScopedModelDescendant<UserModel>(
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
                            key: _formKey2,
                            child: Column(
                              children: <Widget>[
                                Align(
                                  child: Text("Conta Destino"),
                                  alignment: Alignment.centerLeft,
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  margin: EdgeInsets.only(top: 5),
                                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                  decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      borderRadius: BorderRadius.circular(10)),
                                  child: DropdownButton<String>(
                                    isExpanded: true,
                                    underline: SizedBox(),
                                    items: <String>['Conta Corrente', 'Conta Poupança']
                                        .map<DropdownMenuItem<String>>((String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                      onChanged: ( String novoItemSelecionado) {
                                      setState(() {
                                        this._destino =  novoItemSelecionado;
                                      });
                                    },
                                    value: _destino
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Align(
                                  child: Text("Conta Origem"),
                                  alignment: Alignment.centerLeft,
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  margin: EdgeInsets.only(top: 5),
                                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                  decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      borderRadius: BorderRadius.circular(10)),
                                  child: DropdownButton<String>(
                                    isExpanded: true,
                                    underline: SizedBox(),
                                    items: <String>['Conta Corrente', 'Conta Poupança']
                                        .map<DropdownMenuItem<String>>((String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                      onChanged: ( String novoItemSelecionado) {
                                      setState(() {
                                        this._origem =  novoItemSelecionado;
                                      });
                                    },
                                    value: _origem
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
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
                                          onPressed: _destino != null && _origem != null && _valor != null ? () {
                                            if (verificaSaldo(model, _origem, double.tryParse(_valor.text)))
                                              UserModel().transfer(
                                                id: model.id,
                                                cpf:  int.tryParse(_cpf.text),
                                                dCorrente: _origem == "Conta Corrente",
                                                oCorrente: _destino == "Conta Corrente",
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
        ]
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

bool verificaSaldo(UserModel model, String origem, double valor){
  switch(origem){
    case "Conta Corrente": return model.userData['currentBalance'] > valor;
    break;
    case "Conta Poupança": return model.userData['savingsBalance'] > valor;
    break;
    default: return false;
  }

}
