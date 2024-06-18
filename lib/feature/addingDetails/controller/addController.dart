import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nectar_project1/model/addcategory_model.dart';
import 'package:nectar_project1/model/bestSelling_model.dart';
import 'package:nectar_project1/model/exclusive_model.dart';
import 'package:nectar_project1/model/grocery_model.dart';
import 'package:nectar_project1/model/pulses_model.dart';
import 'package:nectar_project1/model/userModel.dart';

import '../repository/addRepository.dart';

final addingController = Provider((ref) => AddingController(addRepository: ref.watch(addingRepository)));

// to stream AddCategory
final addCategoryProvider = StreamProvider((ref) => ref.watch(addingController).addCategoryController());

// to stream exclusive list
final exclusiveStreamProvider = StreamProvider((ref) => ref.watch(addingController).exclusiveStreamController());

// to stream pulse list
final pulsesStreamprovider = StreamProvider((ref) => ref.watch(addingController).pulsesstreamcntroller());

// to stream grocery list
final groceryStreamprovider = StreamProvider((ref) => ref.watch(addingController).grocerystreamcontroller());

// to stream best selling list
final bestsellingStreamProvider = StreamProvider((ref) => ref.watch(addingController).bestSellingStreamController());

class AddingController{
final AddingRepository _addrepository;
AddingController({
  required AddingRepository addRepository
}) : _addrepository=addRepository;

controlCollectionFunc({required UserModel userModel}){
  _addrepository.collectionFunc(userModel: userModel);
}

//stream function for showing categories
  Stream<List<AddCategoryModel>> addCategoryController(){
  return _addrepository.addCategoryStream();
  }

//stream function of exclusive list
Stream<List<ExclusiveModel>>exclusiveStreamController(){
  return _addrepository.exclusiveStream();
}

//stream function of bestSelling list
Stream<List<BestSellingModel>>bestSellingStreamController(){
  return _addrepository.bestSellingStream();
}

//stream function for showing pulses
Stream<List<PulsesModel>>pulsesstreamcntroller(){
  return _addrepository.pulsesstream();
}

//stream function for showing groceries
Stream<List<GroceryModel>>grocerystreamcontroller(){
  return _addrepository.grocerystream();
}

}
