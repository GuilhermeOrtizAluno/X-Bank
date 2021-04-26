import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/models/transacao.dart';

class Repositorio {
  final List<Transacoes> _transacoes = [];
  get transacoes => this._transacoes;

  void addTransacao({motivo, valor, tipo, pessoa, conta1, conta2}) {
    transacoes.motivo.add(motivo);
    transacoes.valor.add(valor);
    transacoes.tipo.add(tipo);
    transacoes.pessoa.add(pessoa);
    transacoes.conta1.add(conta1);
    transacoes.conta2.add(conta2);
  }

  Repositorio() {
    _transacoes.addAll([
      Transacoes(
        motivo: "XTUDO_E_MAIS_UM_POUCO",
        valor: 21.50,
        tipo: "Transferencia",
        pessoa: "Zé Paulo",
        conta1: "Corrente",
        conta2: "Poupança",
      ),
      Transacoes(
        motivo: "XTUDO_RATÃO",
        valor: 24.99,
        tipo: "Transferencia",
        pessoa: "Zé Paulo",
        conta1: "Corrente",
        conta2: "Poupança",
      ),
      Transacoes(
        motivo: "SUCO_DE_GOIABA",
        valor: 6.75,
        tipo: "Transferencia",
        pessoa: "Zé Paulo",
        conta1: "Corrente",
        conta2: "Poupança",
      ),
      Transacoes(
        motivo: "PRETARRÃO_COM_QUIEJO",
        valor: 10.20,
        tipo: "Transferencia",
        pessoa: "Zé Paulo",
        conta1: "Corrente",
        conta2: "Poupança",
      ),
      Transacoes(
        motivo: "DOCE_DE_ABOBURA_SALGADA",
        valor: 5.70,
        tipo: "Transferencia",
        pessoa: "Zé Paulo",
        conta1: "Corrente",
        conta2: "Poupança",
      ),
      Transacoes(
        motivo: "SUCO_DETOX_DE_BETERRABA",
        valor: 11.35,
        tipo: "Transferencia",
        pessoa: "Zé Paulo",
        conta1: "Corrente",
        conta2: "Poupança",
      ),
    ]);
  }
}
