import 'package:flutter/material.dart';

import 'home_feature/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      /// This is the first page loaded
      /// in your Flutter app.
      home: const HomePage(),
    );
  }
}
