import 'package:flutter/material.dart';
import 'load_local_img.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'local images',
      debugShowCheckedModeBanner: false,
      home:MyHome(),
      theme: ThemeData(
        accentColor: Colors.lightGreenAccent,
        primarySwatch: Colors.pink,
        backgroundColor: Colors.black12
      ),
    );
  }
}

