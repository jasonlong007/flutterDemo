import 'package:flutter/material.dart';
import './utilas.dart' as utilas;
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Using Custom Fonts',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Using Custom Fonts'),
        ),
        body: Center(
          child: Container(
            child: Text('我是一个帅哥',
            textAlign: TextAlign.center,
            style: utilas.getCustomFontTextStyle(),
            ),
            
          ),
        ),
      ),
    );
  }
}