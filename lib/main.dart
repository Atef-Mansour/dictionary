import 'package:flutter/material.dart';
import 'package:session5/element.dart';
import 'package:intl/intl.dart';
import './element_list_screen.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ElementListScreen(),
    );
  }
}


