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
      padding: EdgeInsets.only(left: 15, right: 20, top: 15, bottom: 15),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(25)), 
        color: Theme.of(context).accentColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:<Widget> [
          Column(
            children: <Widget>[
              Text(
                "Saldo Conta Corrente",
                style: Theme.of(context).textTheme.bodyText1,
              ),
              Row(
                children: <Widget>[
                  Text(
                    current ?  "180,00 R\$" : "****" ,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: InkWell(
                      child: Icon(
                        !current ? Icons.remove_red_eye : Icons.remove_red_eye_outlined,
                        color: Colors.white,
                      ),
                      onTap: (){
                        setState(() {
                          current = current ? false : true;
                        });
                      },
                    ),
                  )
                ],
              )
            ],
          ),
          Column(
            children: <Widget>[
              Text(
                "Saldo Poupança",
                style: Theme.of(context).textTheme.bodyText1,
              ),
              Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(right: 20),
                    child: InkWell(
                      child: Icon(
                        !savings ? Icons.remove_red_eye : Icons.remove_red_eye_outlined,
                        color: Colors.white
                      ),
                      onTap: (){
                        setState(() {
                          savings = savings ? false : true;
                        });
                      },
                    ), 
                  ),
                  Text(
                    savings ?  "1080,00 R\$" : "****",
                    style: Theme.of(context).textTheme.bodyText1,
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