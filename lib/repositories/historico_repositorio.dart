import 'dart:collection';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/models/transacao.dart';

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter/material.dart';

import '../models/transacao.dart';

class Repositorio {
  final List<Transacoes> _transacoes = [];
  get transacoes => this._transacoes;
  FirebaseUser firebaseUser;
  Map<String, dynamic> data = Map();

  Future<Null> addTransacao(
      {motivo, valor, tipo, pessoa, conta1, conta2}) async {
    transacoes.motivo.add(motivo);
    transacoes.valor.add(valor);
    transacoes.tipo.add(tipo);
    transacoes.pessoa.add(pessoa);
    transacoes.conta1.add(conta1);
    transacoes.conta2.add(conta2);

    Firestore.instance.collection("transacao").document().setData({
      'motivo': 'motivo',
      'valor': 'valor',
      'tipo': 'tipo',
      'pessoa': 'pessoa',
      'conta1': 'conta1',
      'conta2': 'conta2'
    });
  }

  Repositorio() {
    _transacoes.addAll([
      Transacoes(
        motivo: "XTUDO_E_MAIS_UM_POUCO",
        valor: "21.50",
        tipo: "Transferencia",
        pessoa: "Zé Paulo",
        conta1: "Corrente",
        conta2: "Poupança",
      ),
      Transacoes(
        motivo: "XTUDO_RATÃO",
        valor: "24.99",
        tipo: "Transferencia",
        pessoa: "Zé Paulo",
        conta1: "Corrente",
        conta2: "Poupança",
      ),
      Transacoes(
        motivo: "SUCO_DE_GOIABA",
        valor: "6.75",
        tipo: "Transferencia",
        pessoa: "Zé Paulo",
        conta1: "Corrente",
        conta2: "Poupança",
      ),
      Transacoes(
        motivo: "PRETARRÃO_COM_QUIEJO",
        valor: "10.20",
        tipo: "Transferencia",
        pessoa: "Zé Paulo",
        conta1: "Corrente",
        conta2: "Poupança",
      ),
      Transacoes(
        motivo: "DOCE_DE_ABOBURA_SALGADA",
        valor: "5.70",
        tipo: "Transferencia",
        pessoa: "Zé Paulo",
        conta1: "Corrente",
        conta2: "Poupança",
      ),
      Transacoes(
        motivo: "SUCO_DETOX_DE_BETERRABA",
        valor: "11.35",
        tipo: "Transferencia",
        pessoa: "Zé Paulo",
        conta1: "Corrente",
        conta2: "Poupança",
      ),
    ]);
  }
}
