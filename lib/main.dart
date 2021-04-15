import 'package:flutter/material.dart';
import 'screens/login.dart';

void main() => runApp(Program());

class Program extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'X-BANK',
      theme: ThemeData(
        primaryColor: Color.fromRGBO(52, 20, 250, 1),
        accentColor: Color.fromRGBO(52, 20, 250, 1),
        buttonColor: Color.fromRGBO(20, 126, 250, 1),
        textTheme: TextTheme(
          headline1: TextStyle(fontSize: 35, fontWeight: FontWeight.bold, color: Colors.white), // titulo
          headline2: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic), // subtitulo
          bodyText1: TextStyle(fontSize: 14.0, fontFamily: 'Hind', color: Colors.white), // texto
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
