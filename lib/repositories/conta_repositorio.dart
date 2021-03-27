import 'dart:collection';
import '../controllers/conta.dart';
import '../models/corrente.dart';
import '../models/corrente.dart';
import '../models/poupanca.dart';
import 'package:flutter/cupertino.dart';

class Repositorio {
  final List<Corrente> _corrente = [];
  get corrente => this._corrente;

  void addCorrente({valorcorrente}) {
    corrente.valorcorrente.add(valorcorrente);
  }

  final List<Poupanca> _poupanca = [];
  get poupanca => this._corrente;

  void addPoupanca({valorpoupanca}) {
    poupanca.valorpoupanca.add(valorpoupanca);
  }

  Repositorio() {
    _corrente.addAll([
      Corrente(
        valorcorrente: 200.00,
      ),
    ]);
    _poupanca.addAll([
      Poupanca(
        valorpoupanca: 500.00,
      ),
    ]);
  }
}
