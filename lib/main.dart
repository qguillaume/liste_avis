import 'package:flutter/material.dart';
import 'views/home_page.dart';
import 'controllers/controller_avis.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final ControllerAvis controllerAvis = ControllerAvis();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(controllerAvis: controllerAvis),
    );
  }
}
