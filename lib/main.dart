import 'package:flutter/material.dart';
import 'ui/views/homePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'test_Api',
      home: MyHomePage(title: 'Accueil'),
    );
  }
}

