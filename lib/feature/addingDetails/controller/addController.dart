import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nectar_project1/model/addcategory_model.dart';
import 'package:nectar_project1/model/bestSelling_model.dart';
import 'package:nectar_project1/model/exclusive_model.dart';
import 'package:nectar_project1/model/pulses_model.dart';
import 'package:nectar_project1/model/userModel.dart';

import '../repository/addRepository.dart';

final addingController = Provider((ref) => AddingController(addRepository: ref.watch(addingRepository)));

final addCategoryProvider = StreamProvider((ref) => ref.watch(addingController).addCategoryController());

final exclusiveStreamProvider = StreamProvider((ref) => ref.watch(addingController).exclusiveStreamController());

final pulsesStreamprovider = StreamProvider((ref) => ref.watch(addingController).pulsesstreamcntroller());


final groceryStreamprovider = StreamProvider((ref) => ref.watch(addingController).grocerystreamcontroller());

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


Stream<List<PulsesModel>>grocerystreamcontroller(){
  return _addrepository.grocerystream();
}

}