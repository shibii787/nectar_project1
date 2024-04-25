import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nectar_project1/core/providers/firebase_providers.dart';
import 'package:nectar_project1/model/userModel.dart';

final authRepositoryProvider=Provider((ref) => AddAuth(auth: ref.watch(authProvider), firestore: ref.watch(collectionProvider)));

class AddAuth{
  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;
  AddAuth({
    required FirebaseAuth auth,required FirebaseFirestore firestore
}) : _auth=auth, _firestore=firestore;

  CollectionReference get _authUser => _firestore.collection("account");

  authFunc({required UserModel userModel}){
    _authUser.add(userModel.tomap());
  }

}