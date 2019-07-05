import 'package:flutter/material.dart';

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  // 创建一个弹窗
  AlertDialog dialog=new AlertDialog(
    content: Text(
      'Hello World',
      style:TextStyle(
       fontSize:30.0
      )
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('using Alert Dialog'),
      ),
      body: Container(
        child: Center(
          child: RaisedButton(
            child: Text('点我一下'),
            onPressed: (){
              showDialog(context: context,builder: (BuildContext context){
               return dialog;
              });
            },
          ),
        ),
      ),
    );
  }
}