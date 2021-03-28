import 'package:flutter/material.dart';

class Options {
  const Options({this.titulo, this.icon});
  final String titulo;
  final IconData icon;
}

class Grid_Options extends StatelessWidget {
  const Grid_Options({Key key, this.options}) : super(key: key);
  final Options options;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color.fromRGBO(52, 20, 250, 1),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(
              options.icon, 
              size:80.0, 
              color: Colors.black
            ),
            Text(
              options.titulo, 
              style: TextStyle(
                color: Colors.black,
                fontSize: 25,
              ),
              textAlign: TextAlign.center,
            ),
          ]
        ),
      )
    );
  }
}