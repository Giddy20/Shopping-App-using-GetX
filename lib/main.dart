import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app_api/Screens/Products%20Details.dart';

import 'Screens/HomeScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      home: HomePage(),
    );
  }
}

