import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nectar_project1/model/exclusive_model.dart';
import 'package:nectar_project1/model/userModel.dart';

import '../repository/addRepository.dart';

final addingController = Provider((ref) => AddCollectionController(addRepository: ref.watch(addingRepository)));

final exclusiveStreamProvider = StreamProvider((ref) => ref.watch(addingController).exclusiveStreamController());

class AddCollectionController{
final AddCollection _addrepository;
AddCollectionController({
  required AddCollection addRepository
}) : _addrepository=addRepository;

controlCollectionFunc({required UserModel userModel}){
  _addrepository.collectionFunc(userModel: userModel);
}

Stream<List<ExclusiveModel>>exclusiveStreamController(){
  return _addrepository.exclusiveStream();
}

}