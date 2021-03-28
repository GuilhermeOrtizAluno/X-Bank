import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/convert/user.dart';

class UserModel {

  bool isLoading = false;
  var users;

  void signIn({@required String username, @required String pass,
      @required VoidCallback onSuccess, @required VoidCallback onFail}) async {

    isLoading = true;

    String jsonString = await _loadCurrentUser();
    final jsonResponse = json.decode(jsonString);
    users = new User.fromJson(jsonResponse);
    if(users.user == username && users.password == pass)
      onSuccess();
    else onFail();
    isLoading = false;
    
  }

  void signOut() async {
    //await _auth.signOut();

    // users = null;
    // user = null;

    
  }

  bool isLoggedIn(){
    //return user != null;
  }

  Future<String> _loadCurrentUser() async { 
    
    return await rootBundle.loadString('json/user.json');
  }



}