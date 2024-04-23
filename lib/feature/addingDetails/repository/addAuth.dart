import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nectar_project1/core/providers/firebase_providers.dart';

final addAuthRepository=Provider((ref) => AddAuth(firebaseAuth: ref.watch(authProvider)));

class AddAuth{
  final FirebaseAuth _firebaseAuth;
  AddAuth({
    required FirebaseAuth firebaseAuth
}) : _firebaseAuth=firebaseAuth;

  //CollectionReference get _auth  => _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);

}