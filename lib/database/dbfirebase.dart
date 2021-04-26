import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/firebase.dart';

class DBfire {
  DBfire._();
  static final DBfire _instance = DBfire._();

  final Firestore _firestore = Firestore.instance;

  static get() {
    return DBfire._instance._firestore;
  }
}
