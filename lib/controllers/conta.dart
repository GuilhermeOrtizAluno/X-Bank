import '../models/poupanca.dart';
import '../repositories/conta_repositorio.dart';
import '../models/corrente.dart';

class Conta {
  Repositorio repositorio;

  List<Corrente> get contacorrente => repositorio.corrente;
  List<Poupanca> get contapoupanca => repositorio.poupanca;

  Conta() {
    repositorio = Repositorio();
  }
}
