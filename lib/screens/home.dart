import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/grid_options.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

const List<Options> options = const <Options>[
  const Options(titulo: 'Saldo e Extrato', icon: Icons.attach_money),
  const Options(titulo: 'Tranferencia', icon: Icons.autorenew_sharp),
  const Options(titulo: 'Pagar Conta', icon: Icons.money),
  const Options(titulo: 'Cartão', icon: Icons.credit_card_outlined),
];

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('XBank'),
      ),
      body: Container( 
        color: Color.fromRGBO(52, 20, 250, 1),
        child: GridView.count(
            crossAxisCount: 2,
            children: List.generate(options.length, (index) {
              return Center(
                child: Grid_Options(options: options[index]),
              );
            }
          )
        )
      )
     );
  }
}