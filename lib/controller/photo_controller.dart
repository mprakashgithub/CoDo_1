import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/photo_response.dart';

class PhotoController {
  // Future<List<PhotoResponse>?> photoApi() async {
  //   List<PhotoResponse> listData = [];
  //   try {
  //     http.Response response = await http
  //         .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
  //     // var request = http.Request(
  //     //     'GET', Uri.parse('https://jsonplaceholder.typicode.com/photos'));

  //     // http.StreamedResponse response = await request.send();

  //     if (response.statusCode == 200) {
  //       // List list = jsonDecode(response.body);
  //       var responseData = json.decode(response.body);
  //       responseData.forEach((element) {
  //         listData.add(PhotoResponse.fromJson(element));
  //       });

  //       print(" =-==-=-= > $listData['id']");
  //     } else {
  //       print(response.reasonPhrase);
  //     }
  //     // return listData;
  //   } catch (e) {
  //     print(e);
  //   }
  //   return listData;
  // }

  List<dynamic> photoList = [];
  Future<List?> getRepoData() async {
    try {
      http.Response response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));

      if (response.statusCode == 200) {
        print("Status");
        var data = response.body;
        // print("data: $data");
        List listData = json.decode(data);
        print("listData: $listData");
        print("listData length :${listData.length}");
        photoList.addAll(listData);
        // for (int i = 0; i < photoList.length; i++) {
        // print(photoList[i]);
        // }
        print("photoList: ${photoList[2]}");
        // listData.forEach((element) {
        //   print("element $element");
        //   photoList.add(element);
        // });
        return photoList;
      }
    } catch (e) {
      throw (e);
    }
  }

  // Future<List<PhotoResponse>?> getRepoData() async {
  //   try {
  //     var request = http.Request(
  //         'GET', Uri.parse('https://jsonplaceholder.typicode.com/photos'));
  //     http.StreamedResponse response = await request.send();
  //     if (response.statusCode == 200) {
  //       var data = await response.stream.bytesToString();
  //       print("data $data");
  //       var map = json.decode(data);
  //       print("map: $map");
  //       var model = PhotoResponse.fromJson(map);
  //       print("model :$model");
  //       // return model;
  //       map.forEach((element) {
  //         print("element $element");
  //         photoList.add(element);
  //       });
  //       print("photoList: $photoList");
  //       return photoList;
  //     } else {
  //       print(response.reasonPhrase);
  //     }
  //   } catch (e) {
  //     throw (e);
  //   }
  // }
}
