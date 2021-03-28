import 'dart:async';
import 'dart:convert';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class UserModel extends Model {

  var users = {
    "user" : "admin",
    "senha" : "123" 
  };

  String user;
  Map<String, dynamic> userData = new Map();

  bool isLoading = false;

  static UserModel of(BuildContext context) =>
      ScopedModel.of<UserModel>(context);

  void signIn({@required String email, @required String pass,
      @required VoidCallback onSuccess, @required VoidCallback onFail}) async {

    isLoading = true;
    notifyListeners();

    _auth.
    signInWithEmailAndPassword(email: email, password: pass).then(
      (user) async {
        firebaseUser = user;

        await _loadCurrentUser();

        onSuccess();
        isLoading = false;
        notifyListeners();

    }).catchError((e){
      onFail();
      isLoading = false;
      notifyListeners();
    });

  }

  void signOut() async {
    await _auth.signOut();

    userData = Map();
    user = null;

    notifyListeners();
  }

  bool isLoggedIn(){
    return user != null;
  }

  Future<Null> _loadCurrentUser() async {
    if(firebaseUser == null)
      firebaseUser = await _auth.currentUser();
    if(firebaseUser != null){
      if(userData["name"] == null){
        DocumentSnapshot docUser =
          await Firestore.instance.collection("users").document(firebaseUser.uid).get();
        userData = docUser.data;
      }
    }
    notifyListeners();
  }



}