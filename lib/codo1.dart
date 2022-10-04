import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'provider/codo1_provider.dart';

class CoDo1 extends StatefulWidget {
  const CoDo1({Key? key}) : super(key: key);

  @override
  State<CoDo1> createState() => _CoDo1State();
}

class _CoDo1State extends State<CoDo1> {
  double? _width;

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    return ChangeNotifierProvider<Codo1Provider>(
        create: (context) => Codo1Provider(),
        builder: (context, snapshot) {
          return SafeArea(
              child: Scaffold(
            backgroundColor: Color.fromARGB(255, 192, 211, 245),
            appBar: AppBar(
              backgroundColor: Color.fromARGB(255, 192, 211, 245),
              title: Text("Parameters"),
              centerTitle: true,
              automaticallyImplyLeading: false,
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                  )),
              elevation: 0,
            ),
            body: Consumer<Codo1Provider>(builder: (context, provider, child) {
              return Container(
                width: _width,
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Column(
                  children: [
                    Card(
                      elevation: 8,
                      color: Colors.lightGreen,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Code ID:",
                                ),
                                Text(
                                  "Coder Name:",
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "CoDo 1",
                                ),
                                Text(
                                  "Manish Prakash",
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Divider(),
                    paramHeader(),
                    radioOption(provider)
                  ],
                ),
              );
            }),
            bottomNavigationBar: Container(
                padding: const EdgeInsets.only(
                    right: 15, left: 15, top: 5, bottom: 5),
                child: MaterialButton(
                    color: Color.fromARGB(255, 224, 194, 149),
                    onPressed: (() {}),
                    child: Text(
                      "Thanks",
                      style: TextStyle(color: Colors.black),
                    ))),
          ));
        });
  }

  Widget paramHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Parameters",
          style: TextStyle(color: Colors.blue),
        ),
        SizedBox(
          width: _width! * 0.46,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "Yes",
                style: TextStyle(color: Colors.blue),
              ),
              Text(
                "No",
                style: TextStyle(color: Colors.blue),
              ),
              Text(
                "NA",
                style: TextStyle(color: Colors.blue),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget radioOption(Codo1Provider provider) {
    return Expanded(
      child: ListView.builder(
          itemCount: provider.selectedParams.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                    width: _width! * 0.45,
                    child: Text(provider.selectedParams[index]["p_name"])),
                Container(
                  width: _width! * 0.45,
                  padding: const EdgeInsets.only(left: 0, right: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Radio(
                          value: provider.paramVal[0],
                          activeColor: Colors.orange,
                          groupValue: provider.selectedParams[index]
                              ["selected_val"],
                          onChanged: (value) {
                            setState(() {
                              provider.selectedParams[index]["selected_val"] =
                                  value.toString();
                              debugPrint(
                                  "Selected val: ${provider.selectedParams[index]["selected_val"]}");
                            });
                          }),
                      Radio(
                          value: provider.paramVal[1],
                          activeColor: Colors.orange,
                          groupValue: provider.selectedParams[index]
                              ["selected_val"],
                          onChanged: (value) {
                            setState(() {
                              provider.selectedParams[index]["selected_val"] =
                                  value.toString();
                            });
                            debugPrint(
                                "Selected val: ${provider.selectedParams[index]["selected_val"]}");
                          }),
                      Radio(
                          value: provider.paramVal[2],
                          activeColor: Colors.orange,
                          groupValue: provider.selectedParams[index]
                              ["selected_val"],
                          onChanged: (value) {
                            setState(() {
                              provider.selectedParams[index]["selected_val"] =
                                  value.toString();
                            });
                            debugPrint(
                                "Selected val: ${provider.selectedParams[index]["selected_val"]}");
                          }),
                    ],
                  ),
                )
              ],
            );
          }),
    );
  }
}
