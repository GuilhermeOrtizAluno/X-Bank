import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/pay.dart';
import 'package:flutter_application_1/screens/saldo_extrato.dart';
import 'package:flutter_application_1/screens/transferencia.dart';

class Options {
  const Options({this.titulo, this.icon, this.navi});
  final String titulo;
  final IconData icon;
  final int navi;
}

class Grid_Options extends StatelessWidget {
  const Grid_Options({Key key, this.options}) : super(key: key);
  final Options options;
  
  @override
  Widget build(BuildContext context) {

    void _transfer(){
      Navigator.push(context, 
        MaterialPageRoute(builder: (context) => Transferencia())
      );
    }

    void _saldo(){
      Navigator.push(context, 
        MaterialPageRoute(builder: (context) => Saldo())
      );
    }

    void _pay(){
      Navigator.push(context, 
        MaterialPageRoute(builder: (context) => Pay())
      );
    }

    return InkWell(
      child: Card(
        color: Theme.of(context).accentColor,
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(
                  options.icon, 
                  size:80.0, 
                  color: Colors.white
                ),
                Text(
                  options.titulo, 
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                  textAlign: TextAlign.center,
                ),
              ]
            ),
          ),
        )
      ),
      onTap: options.navi == 1 ? _saldo : 
             options.navi == 2 ? _transfer : 
             options.navi == 3 ? _pay : null
    );
  }
}