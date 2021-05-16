import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter/material.dart';

class UserModel extends Model {

  FirebaseAuth _auth = FirebaseAuth.instance;

  FirebaseUser firebaseUser;
  Map<String, dynamic> userData = Map();

  String id; 

  bool isLoading = false;

  static UserModel of(BuildContext context) =>
      ScopedModel.of<UserModel>(context);

  @override
  void addListener(VoidCallback listener) {
    super.addListener(listener);

    _loadCurrentUser();
  }

  void load(){
    _loadCurrentUser();
  }

  void signUp({@required Map<String, dynamic> userData, @required String pass, @required String email,
      @required VoidCallback onSuccess, @required VoidCallback onFail}){

    isLoading = true;
    notifyListeners();

    _auth.createUserWithEmailAndPassword(
        email: email,
        password: pass
    ).then((user) async {
      firebaseUser = user;

      await _saveUserData(userData);

      onSuccess();
      isLoading = false;
      notifyListeners();
    }).catchError((e){
      onFail();
      isLoading = false;
      notifyListeners();
    });

  }

  void signIn({@required String email, @required String pass,
      @required VoidCallback onSuccess, @required VoidCallback onFail}) async {

    isLoading = true;
    notifyListeners();

    _auth.signInWithEmailAndPassword(email: email, password: pass).then(
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

  void transfer({@required int cpf, @required bool oCorrente, @required bool dCorrente, @required double valor,
      @required VoidCallback onSuccess, @required VoidCallback onFail, @required String id}) async{
        this.id = id;
        isLoading = true;
        notifyListeners();
        try{
          await _transfer(valor, oCorrente, dCorrente, cpf);
          onSuccess();
        }catch(e){
          onFail();
        }finally{
          isLoading = false;
          notifyListeners();
        }
  }

  void pay({@required double valor, 
    @required VoidCallback onSuccess, @required VoidCallback onFail, @required String id})async{
      this.id = id;
      isLoading = true;
      notifyListeners();
      try{
        await _pay(valor);
        onSuccess();
      }catch(e){
        onFail();
      }finally{
        isLoading = false;
        notifyListeners();
      }
  }
  
  void signOut() async {
    await _auth.signOut();

    userData = Map();
    firebaseUser = null;

    notifyListeners();
  }

  void recoverPass(String email){
    _auth.sendPasswordResetEmail(email: email);
  }

  bool isLoggedIn(){
    return firebaseUser != null;
  }

  Future<Null> _saveUserData(Map<String, dynamic> userData) async {
    this.userData = userData;
    await Firestore.instance.collection("users").document(firebaseUser.uid).setData(userData);
    id = firebaseUser.uid;
  }

  Future<Null> _loadCurrentUser() async {
    if(firebaseUser == null)
      firebaseUser = await _auth.currentUser();
    if(firebaseUser != null){
      if(userData["name"] == null){
        DocumentSnapshot docUser =
          await Firestore.instance.collection("users").document(firebaseUser.uid).get();
        userData = docUser.data;
        this.id = firebaseUser.uid;
      }
    }
  }

  Future<Null> _transfer(double valor, bool oCorrente, bool dCorrente, int cpf) async{
    DocumentSnapshot oUser =
          await Firestore.instance.collection("users").document(this.id).get();
    if(oCorrente){
      await Firestore.instance.collection("users").document(this.id).updateData({
        'currentBalance': oUser['currentBalance'] - valor
      });
    }
    else await Firestore.instance.collection("users").document(this.id).updateData({
      'savingsBalance': oUser['savingsBalance'] - valor
    });

    String dId;

    QuerySnapshot qUser =
          await Firestore.instance.collection("users").getDocuments();
    qUser.documents.forEach((e) { 
      if(e.data['cpf'] == cpf)
        dId = e.documentID;
    });
    print(dId);
    DocumentSnapshot dUser =
          await Firestore.instance.collection("users").document(dId).get();

    if(dCorrente){
      await Firestore.instance.collection("users").document(dId).updateData({
        'currentBalance': dUser['currentBalance'] + valor
      });
    }
    else await Firestore.instance.collection("users").document(dId).updateData({
      'savingsBalance': dUser['savingsBalance'] + valor
    });

  }

  Future<Null> _pay(double valor) async{
    DocumentSnapshot oUser =
          await Firestore.instance.collection("users").document(this.id).get();
    await Firestore.instance.collection("users").document(this.id).updateData({
      'currentBalance': oUser['currentBalance'] - valor
    });
    
  }
}