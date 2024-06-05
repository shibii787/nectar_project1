import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nectar_project1/core/providers/firebase_providers.dart';
import 'package:nectar_project1/model/bestSelling_model.dart';
import 'package:nectar_project1/model/category_model.dart';
import 'package:nectar_project1/model/exclusive_model.dart';
import 'package:nectar_project1/model/userModel.dart';

final addingRepository=Provider((ref) => AddingRepository(firestore: ref.watch(collectionProvider)));

class AddingRepository{
  final FirebaseFirestore _firestore;
  AddingRepository({
    required FirebaseFirestore firestore,
}) : _firestore=firestore;

  //To add account collection into the firebase
  CollectionReference get _account => _firestore.collection("account");

  //A function to add subItem collection
  CollectionReference get _categoryItems => _firestore.collection("categories");
  
  //To make exclusive list into a stream provider
  CollectionReference get _exclusive => _firestore.collection("exclusive");
  
  //To make bestSelling list into stream provider
  CollectionReference get _bestSelling => _firestore.collection("bestSelling");

  collectionFunc({required UserModel userModel}){
    _account.add(userModel.tomap()).then((value) {
      value.update({
        "id" : value.id
      });
    });
  }

  //To Stream exclusive list
Stream<List<ExclusiveModel>> exclusiveStream(){
    return _exclusive.snapshots().map((event) => event.docs.map((e) => ExclusiveModel.fromMap(e.data() as Map<String,dynamic>)).toList());
}

  //To Stream bestSelling list
Stream<List<BestSellingModel>> bestSellingStream(){
    return _bestSelling.snapshots().map((event) => event.docs.map((e) => BestSellingModel.fromMap(e.data() as Map<String,dynamic>)).toList());
}

  //To stream meat and fish only in home screen
Stream meatAndFishStream(){
    return _categoryItems.doc("53edLTtx3FBcTPh5c0iz").collection("subItems").snapshots();
}

}