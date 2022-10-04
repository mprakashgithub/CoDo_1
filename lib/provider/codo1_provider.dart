import 'package:flutter/cupertino.dart';

class Codo1Provider with ChangeNotifier {
  List selectedParams = [
    {"p_name": "Param 1", "selected_val": ""},
    {"p_name": "Param 2", "selected_val": ""},
    {"p_name": "Param 3", "selected_val": ""},
    {"p_name": "Param 4", "selected_val": ""},
    {"p_name": "Param 5", "selected_val": ""},
    {"p_name": "Param 6", "selected_val": ""},
    {"p_name": "Param 7", "selected_val": ""},
    {"p_name": "Param 8", "selected_val": ""},
    {"p_name": "Param 9", "selected_val": ""},
    {"p_name": "Param 10", "selected_val": ""},
    {"p_name": "Param 11", "selected_val": ""},
    {"p_name": "Param 12", "selected_val": ""}
  ];

  List<String> paramVal = ["Yes", "No", "NA"];

  ///Params
  String? getParamsValue(int index) {
    return selectedParams[index]["p_name"];
  }

  void setParamsValue(int index, String value) {
    selectedParams[index]["selected_val"] = value;
    notifyListeners();
  }
}
