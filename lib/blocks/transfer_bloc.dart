import 'dart:async';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter_application_1/validators/transfer_validators.dart';
import 'package:rxdart/rxdart.dart';

class TransferBloc extends BlocBase with TransferValidators {

  final _cpfController = BehaviorSubject<String>();
  final _agController = BehaviorSubject<String>();
  final _ccController = BehaviorSubject<String>();
  final _valorController = BehaviorSubject<String>();
  final _nomeController = BehaviorSubject<String>();

  Stream<String> get outCPF => _cpfController.stream.transform(validateCPF);
  Stream<String> get outAg => _agController.stream.transform(validateAg);
  Stream<String> get outCc => _ccController.stream.transform(validateCc);
  Stream<String> get outValor => _valorController.stream.transform(validateValor);
  Stream<String> get outNome => _nomeController.stream.transform(validateNome);

  Stream<bool> get outSubmitValid => Observable.combineLatest4(
      outCPF, outAg, outCc, outNome, (a, b, c, d) => true
  );

  Function(String) get changeCPF => _cpfController.sink.add;
  Function(String) get changeAg => _agController.sink.add;
  Function(String) get changeCc => _ccController.sink.add;
  Function(String) get changeValor => _valorController.sink.add;
  Function(String) get changeNome => _nomeController.sink.add;


  @override
  void dispose() {
    _cpfController.close();
    _agController.close();
    _ccController.close();
    _valorController.close();
    _nomeController.close();
  }

}