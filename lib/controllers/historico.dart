import '../models/transacao.dart';
import '../repositories/historico_repositorio.dart';

class Historico {
  Repositorio repositorio;

  List<Transacoes> get historico => repositorio.transacoes;

  Historico() {
    repositorio = Repositorio();
  }
}
