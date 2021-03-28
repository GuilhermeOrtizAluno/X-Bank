import 'dart:collection';

import 'package:ba/models/transacao.dart';
import 'package:flutter/cupertino.dart';

class Repositorio {
  final List<Transacoes> _transacoes = [];
  get transacoes => this._transacoes;

  void addTransacao({motivo, valor}) {
    transacoes.motivo.add(motivo);
    transacoes.valor.add(valor);
  }

  Repositorio() {
    _transacoes.addAll([
      Transacoes(
        motivo: "XTUDO_E_MAIS_UM_POUCO",
        valor: 21.50,
      ),
      Transacoes(
        motivo: "XTUDO_RATÃO",
        valor: 24.99,
      ),
      Transacoes(
        motivo: "SUCO_DE_GOIABA",
        valor: 6.75,
      ),
      Transacoes(
        motivo: "PRETARRÃO_COM_QUIEJO",
        valor: 10.20,
      ),
      Transacoes(
        motivo: "DOCE_DE_ABOBURA_SALGADA",
        valor: 5.70,
      ),
      Transacoes(
        motivo: "SUCO_DETOX_DE_BETERRABA",
        valor: 11.35,
      ),
    ]);
  }
}
