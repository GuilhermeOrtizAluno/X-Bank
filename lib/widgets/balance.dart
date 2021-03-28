import 'package:flutter/material.dart';

class Balance extends StatefulWidget {
  @override
  _BalanceState createState() => _BalanceState();
}

class _BalanceState extends State<Balance> {
  bool current = false, savings = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.only(left: 15, right: 20),
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:<Widget> [
          Column(
            children: <Widget>[
              Text("Saldo Conta Corrente"),
              Row(
                children: <Widget>[
                  Text(
                    current ?  "180,00 R\$" : "****" ,
                  ),
                  InkWell(
                    child: Icon(
                      !current ? Icons.remove_red_eye : Icons.remove_red_eye_outlined
                    ),
                    onTap: (){
                      setState(() {
                        current = current ? false : true;
                      });
                    },
                  )
                ],
              )
            ],
          ),
          Column(
            children: <Widget>[
              Text("Saldo Poupança"),
              Row(
                children: <Widget>[
                  InkWell(
                    child: Icon(
                      !savings ? Icons.remove_red_eye : Icons.remove_red_eye_outlined 
                    ),
                    onTap: (){
                      setState(() {
                        savings = savings ? false : true;
                      });
                    },
                  ),
                  Text(
                    savings ?  "1080,00 R\$" : "****" 
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}