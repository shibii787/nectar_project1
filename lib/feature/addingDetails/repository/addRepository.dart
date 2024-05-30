import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nectar_project1/core/providers/firebase_providers.dart';
import 'package:nectar_project1/model/userModel.dart';

final addingRepository=Provider((ref) => AddCollection(firestore: ref.watch(collectionProvider)));

class AddCollection{
  final FirebaseFirestore _firestore;
  AddCollection({
    required FirebaseFirestore firestore
}) : _firestore=firestore;

  CollectionReference get _account => _firestore.collection("account");

  collectionFunc({required UserModel userModel}){
    _account.add(userModel.tomap()).then((value) {
      value.update({
        "id" : value.id
      });
    });
  }

}