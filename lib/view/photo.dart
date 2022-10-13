import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/photo_response.dart';
import '../provider/photo_provider.dart';

class Photo extends StatefulWidget {
  const Photo({Key? key}) : super(key: key);

  @override
  State<Photo> createState() => _PhotoState();
}

class _PhotoState extends State<Photo> {
  double? _width, _height;
  late PhotoProvider photoProvider;
  List? photoList;

  @override
  void initState() {
    super.initState();
    photoProvider = Provider.of<PhotoProvider>(context, listen: false);
    photoProvider.getCountryApi();
    // photoList =
    // print(photoProvider.listPhoto!.length);
    // print("photoList : $photoList");
    // Future.delayed(
    //   Duration(seconds: 5),
    //   () {
    //     print("After 5 sec");
    //     // print("photoList : ${photoList!.length} ");
    //   },
    // );
  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    return Scaffold(body:
        //  ChangeNotifierProvider<PhotoProvider>(
        //     create: (_) => PhotoProvider(),
        //     builder: (context, snapshot) {
        //       return
        Consumer<PhotoProvider>(builder: (context, provider, child) {
      print("provider listPhoto length ${provider.listPhoto!.length}");
      return SafeArea(
          child: Container(
              height: _height,
              width: _width,
              padding: const EdgeInsets.only(top: 20),
              child: ListView.builder(
                  itemCount: provider.listPhoto == null ? 0 : photoList!.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        "${provider.listPhoto![index]}",
                        style: const TextStyle(color: Colors.red),
                      ),
                    );
                  })));
    }));
    // }));
  }
}
