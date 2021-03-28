import '../models/poupanca.dart';
import '../repositories/conta_repositorio.dart';
import '../models/corrente.dart';

class Conta {
  Repositorio repositorio;

  List<Corrente> get contacorrente => repositorio.corrente;

  Conta() {
    repositorio = Repositorio();
  }
}
