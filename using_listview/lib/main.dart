import 'package:flutter/material.dart';
import 'cantact_page.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Using Listview',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Using Listview'),
        ),
        body: ContactPage(),
      ),
    );
  }
}