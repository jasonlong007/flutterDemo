import 'package:flutter/material.dart';
import 'expansion_title_demo.dart';
import 'expansion_panel_list.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      theme: ThemeData.dark(),
      // home: ExpansionTitleDemo(),
      home: ExapansionPaneListDemo(),
       
      );
    
  }
}