
import 'package:flutter/material.dart';
import 'alert_dialog.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: MyHome(),
    );
  }
}