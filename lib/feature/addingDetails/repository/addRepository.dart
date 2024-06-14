import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nectar_project1/core/providers/firebase_providers.dart';
import 'package:nectar_project1/model/addcategory_model.dart';
import 'package:nectar_project1/model/bestSelling_model.dart';
import 'package:nectar_project1/model/exclusive_model.dart';
import 'package:nectar_project1/model/grocery_model.dart';
import 'package:nectar_project1/model/pulses_model.dart';
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
  
  //pulses
  CollectionReference get _pulses => _firestore.collection("pulses");

  //grocery
  CollectionReference get _grocery => _firestore.collection("grocery");

  // To stream categories to app
  CollectionReference get _categories => _firestore.collection("categories");


  collectionFunc({required UserModel userModel}){
    _account.add(userModel.tomap()).then((value) {
      value.update({
        "id" : value.id
      });
    });
  }

  // To stream categories
Stream<List<AddCategoryModel>> addCategoryStream(){
    return _categories.snapshots().map((event) => event.docs.map((e) => AddCategoryModel.fromMap(e.data() as Map<String,dynamic>)).toList());
}

  //To Stream exclusive list
Stream<List<ExclusiveModel>> exclusiveStream(){
    return _exclusive.snapshots().map((event) => event.docs.map((e) => ExclusiveModel.fromMap(e.data() as Map<String,dynamic>)).toList());
}

  //To Stream bestSelling list
Stream<List<BestSellingModel>> bestSellingStream(){
    return _bestSelling.snapshots().map((event) => event.docs.map((e) => BestSellingModel.fromMap(e.data() as Map<String,dynamic>)).toList());
}

  //To Stream pulses list
Stream<List<PulsesModel>> pulsesstream(){
    return _pulses.snapshots().map((event) => event.docs.map((e) => PulsesModel.fromMap(e.data() as Map<String,dynamic>)).toList());
}

Stream<List<PulsesModel>> grocerystream(){
    return _pulses.snapshots().map((event) => event.docs.map((e) => PulsesModel.fromMap(e.data() as Map<String,dynamic>)).toList());
}
}