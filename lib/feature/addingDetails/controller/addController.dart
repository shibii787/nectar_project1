import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nectar_project1/model/bestSelling_model.dart';
import 'package:nectar_project1/model/exclusive_model.dart';
import 'package:nectar_project1/model/pulses_model.dart';
import 'package:nectar_project1/model/userModel.dart';

import '../repository/addRepository.dart';

final addingController = Provider((ref) => AddingController(addRepository: ref.watch(addingRepository)));

final exclusiveStreamProvider = StreamProvider((ref) => ref.watch(addingController).exclusiveStreamController());

final meatAndFishProvider =StreamProvider((ref) => ref.watch(addingController).meatAndFishController());

final pulsesStreamprovider = StreamProvider((ref) => ref.watch(addingController).pulsesstreamcntroller());

final bestsellingStreamProvider = StreamProvider((ref) => ref.watch(addingController).bestSellingStreamController());

class AddingController{
final AddingRepository _addrepository;
AddingController({
  required AddingRepository addRepository
}) : _addrepository=addRepository;

controlCollectionFunc({required UserModel userModel}){
  _addrepository.collectionFunc(userModel: userModel);
}

//stream function of exclusive list
Stream<List<ExclusiveModel>>exclusiveStreamController(){
  return _addrepository.exclusiveStream();
}

//stream function of bestSelling list
Stream<List<BestSellingModel>>bestSellingStreamController(){
  return _addrepository.bestSellingStream();
}

//stream function for showing meat and fish items in home screen
Stream meatAndFishController(){
  return _addrepository.meatAndFishStream();
}
//stream function for showing pulses
Stream<List<PulsesModel>>pulsesstreamcntroller(){
  return _addrepository.pulsesstream();
}

}