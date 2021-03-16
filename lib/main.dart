import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'X-Bank',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                    Container(
                      margin: EdgeInsets.only(top: 10, bottom: 5),
                      color: Color.fromRGBO(229, 229, 229, 1),
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Usuario',
                        ),
                        textAlign: TextAlign.center,
                      )
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 5),
                      color: Color.fromRGBO(229, 229, 229, 1),
                      child: TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Senha',
                        ),
                        textAlign: TextAlign.center,
                      )
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 5),
                      child: InkWell(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            'Esqeuceu a Senha?',
                            style: TextStyle(
                              color: Colors.red,
                            ),
                          ),
                        )
                        //onTap: 
                      ),
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
                              child: Text("Entrar"),
                              //onPressed: snapshot.hasData ? _loginBloc.submit : null,
                              textColor: Colors.white,
                              disabledColor: Colors.grey
                            ),
                          );
                        }
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 5),
                      child: InkWell(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            'Cadastrar-se',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        )
                        //onTap: 
                      ),
                    )
                  ],
                ),
              )
            ]
          ),
        )
      )
    );
  }
}
