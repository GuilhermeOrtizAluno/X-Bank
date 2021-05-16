import 'dart:async';

class RegisterValidators {

  final validateName = StreamTransformer<String, String>.fromHandlers(
    handleData: (name, sink){
      if(name.isNotEmpty){
        sink.add(name);
      } else {
        sink.addError("Nome inválido!");
      }
    }
  );

  final validateEmail = StreamTransformer<String, String>.fromHandlers(
    handleData: (email, sink){
      if(email.contains("@")){
        sink.add(email);
      } else {
        sink.addError("E-mail inválido!");
      }
    }
  );

  final validatePassword = StreamTransformer<String, String>.fromHandlers(
    handleData: (password, sink){
      if(password.length > 5){
        sink.add(password);
      } else {
        sink.addError("Senha inválida!");
      }
    }
  );

  final validateCpf = StreamTransformer<String, String>.fromHandlers(
    handleData: (cpf, sink){
      if(cpf.length > 10){
        sink.add(cpf);
      } else {
        sink.addError("CPF inválida!");
      }
    }
  );

}