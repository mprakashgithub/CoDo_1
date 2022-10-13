// import 'dart:io';

// void main() {
//   int rows = 6;
//   for (int i = rows; i > 0; i--) {
//     for (int j = rows; j >= i; j--) {
//       // stdout.write('* ');
//       if (i == j) {
//         stdout.write("* ");
//       }
//     }
//     stdout.writeln();
//   }
// }

// import 'package:co_do_1/view/photo.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import 'codo1.dart';
// import 'provider/photo_provider.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: ChangeNotifierProvider<PhotoProvider>(
//           create: (context) => PhotoProvider(),
//           builder: (context, child) {
//             return const Photo();
//           }),
//     );
//   }
// }

import 'package:co_do_1/view/photo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'provider/photo_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ///You can use any provider: Either ChangeNotifierProvider or ListenableProvider
        ChangeNotifierProvider<PhotoProvider>(create: (_) => PhotoProvider()),
        // ListenableProvider<HomeProvider>(create: (_) => HomeProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const Photo(),
      ),
    );
  }
}
