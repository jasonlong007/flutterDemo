import 'package:flutter/material.dart';
import 'my_edittext.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home:MyEditText(),
      debugShowCheckedModeBanner: false,
    );
  }
}