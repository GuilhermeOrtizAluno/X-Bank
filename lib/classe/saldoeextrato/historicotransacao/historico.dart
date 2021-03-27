import 'transacao.dart';
import 'repositorio.dart';

class Historico {
  Repositorio repositorio;

  List<Transacoes> get historico => repositorio.transacoes;

  Historico() {
    repositorio = Repositorio();
  }
}
