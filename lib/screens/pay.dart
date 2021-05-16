import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/user_model.dart';
import 'package:flutter_application_1/widgets/input_field.dart';
import 'package:image_picker/image_picker.dart';
import 'package:scoped_model/scoped_model.dart';

import 'home.dart';

class Pay extends StatefulWidget {
  @override
  _PayState createState() => _PayState();
}

class _PayState extends State<Pay> {

  final barraController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Align(
          alignment: Alignment.centerRight,
          child: Text("Pagar Conta"),
        ),
        elevation: 0,
      ),
      body:  ScopedModelDescendant<UserModel>(
        builder: (context, child, model){
          if(model.isLoading)
            return Center(child: CircularProgressIndicator());  
          return SafeArea(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Theme.of(context).accentColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 40),
                  decoration: BoxDecoration(
                    //quadrado branco
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18.0),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: Colors.grey,
                          blurRadius: 4.0,
                          offset: Offset(0.0, 0.75))
                    ],
                  ),
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    children: <Widget>[
                      InputField(
                        hint: "Codigo de Barras",
                        obscure: false,
                        controller: barraController,
                        //controller: _userController,
                        //error: "Usuario invalido!",
                      ),
                       Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        child: Text("ou"),
                       ),
                       Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        child: InkWell(
                          child: Icon(
                            Icons.camera_alt,
                            size: 50,
                          ),
                          onTap: (){
                            ImagePicker.pickImage(source: ImageSource.camera).then((value) => {
                              setState((){
                                barraController.text = "52463564";
                              })
                            });
                          },
                        )
                       ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        child:  SizedBox(
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          child: ElevatedButton(
                            child: Text("Confimrar"),
                            onPressed:  (){ 

                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text("Divida"),
                                    content: Text(
                                        "Conta de 100R\$"),
                                    actions: <Widget>[
                                      ElevatedButton(
                                        onPressed: () {
                                          if (verificaSaldo(model, 100))
                                          model.pay(
                                            valor: 100, 
                                            onSuccess: _onSuccess, 
                                            onFail: _onFail, 
                                            id: model.id
                                          );
                                          else _saldo();
                                        },
                                        child: const Text("Pagar"),
                                      ),
                                    ],
                                  );
                                },
                              );
                            }
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
          );
        }
      ),
    );
  }

    void _onSuccess(){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Conta paga com sucesso!"),
        backgroundColor: Colors.greenAccent,
        duration: Duration(seconds: 2),
      )
    );
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context)=>Home())
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
