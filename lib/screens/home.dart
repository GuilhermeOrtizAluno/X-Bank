import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/login.dart';
import 'package:flutter_application_1/widgets/balance.dart';
import 'package:flutter_application_1/widgets/grid_options.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter_application_1/models/user_model.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

const List<Options> options = const <Options>[
  const Options(titulo: 'Saldo e Extrato', icon: Icons.attach_money, navi: 1),
  const Options(titulo: 'Tranferencia', icon: Icons.autorenew_sharp, navi: 2),
  const Options(titulo: 'Pagar Conta', icon: Icons.money, navi: 3),
  const Options(titulo: 'Pix', icon: Icons.camera, navi: 4),
  const Options(titulo: 'Fale Conosco', icon: Icons.email, navi: 5),
  const Options(titulo: 'Cartão', icon: Icons.payment , navi: 6),
];

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('X-BANK'),
        elevation: 0,
        actions: <Widget>[
          ScopedModelDescendant<UserModel>(
            builder: (context, child, model){
              return  InkWell(
                child: Container(
                  margin: EdgeInsets.only(right: 20),
                  child: Icon(
                    Icons.exit_to_app,
                    size: 35,
                  ),
                ),
                onTap: (){ 
                  model.signOut();
                  Navigator.pushReplacement(context, 
                    MaterialPageRoute(builder: (context) => LoginScreen())
                  );
                }
              );
            }
          )
        ],
      ),
      body: ScopedModelDescendant<UserModel>(
        builder: (context, child, model){
          model.load();
          if(model.isLoading)
            return Center(child: CircularProgressIndicator());  
          return Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 5, right: 20, bottom: 10),
                color: Theme.of(context).accentColor,
                child:  Row(
                  children:<Widget> [
                    Icon(
                      Icons.person,
                      size: 50,
                      color: Colors.white,
                    ),
                    ScopedModelDescendant<UserModel>(
                      builder: (context, child, model){
                        return Flexible(
                          child: Text(
                            "${model.userData["name"]}",
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.headline1,
                          ),
                        );
                      }
                    )
                  ]
                )
              ),
              Balance(),
              Expanded(
                child: Center(
                  child: GridView.count(
                    padding: EdgeInsets.all(20),
                    crossAxisCount: 2,
                    children: List.generate(options.length, (index) {
                      return Grid_Options(options: options[index]);
                    })
                  ),
                )
              )
            ],
        
          );
        }
      )
    );
  }
}