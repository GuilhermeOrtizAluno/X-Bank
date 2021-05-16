import 'dart:async';

class TransferValidators {

  final validateCPF = StreamTransformer<String, String>.fromHandlers(
    handleData: (cpf, sink){
      if(cpf.length > 10){
        sink.add(cpf);
      } else {
        sink.addError("CPF inválido!");
      }
    }
  );

  final validateNome = StreamTransformer<String, String>.fromHandlers(
    handleData: (qtde, sink){
      if(qtde.length > 1){
        sink.add(qtde);
      } 
      else {
        sink.addError("");
      }
    }
  );

  final validateAg = StreamTransformer<String, String>.fromHandlers(
    handleData: (qtde, sink){
      if(qtde.length > 4){
        sink.add(qtde);
      } 
      else {
        sink.addError("");
      }
    }
  );

  final validateCc = StreamTransformer<String, String>.fromHandlers(
    handleData: (qtde, sink){
      if(qtde.length > 2){
        sink.add(qtde);
      } 
      else {
        sink.addError("");
      }
    }
  );

  final validateValor = StreamTransformer<String, String>.fromHandlers(
    handleData: (qtde, sink){
      if(qtde.length > 1){
        sink.add(qtde);
      } 
      else {
        sink.addError("");
      }
    }
  );

}