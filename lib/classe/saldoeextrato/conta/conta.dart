import 'poupanca.dart';
import 'repositorio.dart';
import 'corrente.dart';

class Conta {
  Repositorio repositorio;

  List<Corrente> get contacorrente => repositorio.corrente;
  List<Poupanca> get contapoupanca => repositorio.poupanca;

  Conta() {
    repositorio = Repositorio();
  }
}
