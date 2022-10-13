import 'package:co_do_1/controller/photo_controller.dart';
import 'package:co_do_1/model/photo_response.dart';
import 'package:flutter/cupertino.dart';

class PhotoProvider with ChangeNotifier {
  List? listPhoto;
  bool isLoaded = false;

  Future<void> getCountryApi() async {
    listPhoto = await PhotoController().getRepoData();
    setIsLoaded(true);
    print("listPhoto provider : $listPhoto");
    notifyListeners();
  }

  bool getIsLoaded() {
    return isLoaded;
  }

  void setIsLoaded(bool value) {
    isLoaded = value;
    notifyListeners();
  }
}
