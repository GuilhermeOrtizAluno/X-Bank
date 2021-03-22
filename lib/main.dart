import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/transferencia.dart';

void main() {
  runApp(new MaterialApp(
    title: 'title',
    home: new MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Telas transferencia e cadastro",
        home: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(20),
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(8),
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Color.fromRGBO(0, 160, 227, 1))),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Transferencia()));
                },
                padding: EdgeInsets.all(10.0),
                color: Colors.blue,
                textColor: Colors.white,
                child:
                    Text("Teste Transferencia", style: TextStyle(fontSize: 15)),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Color.fromRGBO(0, 160, 227, 1))),
                onPressed: () {},
                padding: EdgeInsets.all(10.0),
                color: Colors.blue,
                textColor: Colors.white,
                child: Text("Teste Cadastro", style: TextStyle(fontSize: 15)),
              ),
            ),
          ],
        ));
  }
}
