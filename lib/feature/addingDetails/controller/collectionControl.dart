import 'package:nectar_project1/model/userModel.dart';

import '../repository/addCollection.dart';

class AddCollectionController{
final AddCollection _addrepository;
AddCollectionController({
  required AddCollection addRepository
}) : _addrepository=addRepository;

controlCollectionFunc({required UserModel userModel}){
  _addrepository.collectionFunc(userModel: userModel);
}

}