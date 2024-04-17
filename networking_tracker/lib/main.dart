import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:networking_tracker/pages/home_page.dart';

void main() async {

  // init the hive
  await Hive.initFlutter();

  // open a box
  var box = await Hive.openBox('myBox');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: ThemeData(primarySwatch: Colors.blueGrey, useMaterial3: false),
    );
  }
}
