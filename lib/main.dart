import 'package:flutter/material.dart';
import 'home.dart';
import 'detail.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      routes: {
        '/home': (BuildContext ctx) => HomePage(),
        '/detail': (BuildContext ctx) => detailItem(),
      },
    );
  }
}
