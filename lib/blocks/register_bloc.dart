import 'dart:async';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter_application_1/validators/register_validators.dart';
import 'package:rxdart/rxdart.dart';

class RegisterBloc extends BlocBase with RegisterValidators {

  final _nameController = BehaviorSubject<String>();
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  Stream<String> get outName => _nameController.stream.transform(validateName); 
  Stream<String> get outEmail => _emailController.stream.transform(validateEmail);
  Stream<String> get outPassword => _passwordController.stream.transform(validatePassword);

  Stream<bool> get outSubmitValid => Observable.combineLatest3(
      outEmail, outPassword, outName, (a, b, c) => true
  );

  Function(String) get changeName => _nameController.sink.add;
  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;


  @override
  void dispose() {
    _nameController.close();
    _emailController.close();
    _passwordController.close();
  }

}