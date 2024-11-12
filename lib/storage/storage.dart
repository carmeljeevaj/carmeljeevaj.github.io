

import 'package:get_storage/get_storage.dart';

class Storage{

  final GetStorage getStorage = GetStorage();


  static final Storage _instance = Storage._internal();

  Storage._internal();

  factory Storage(){
    return _instance;
  }


  GetStorage getStorageObj(){
      return getStorage;
  }

}