import 'package:flutter/material.dart';

class EchView extends StatefulWidget {
  String _title;
  EchView(this._title);//上一个导航过来的参数
  @override
  _EchViewState createState() => _EchViewState();
}

class _EchViewState extends State<EchView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget._title,style:TextStyle(color: Colors.white)),
        
      ),
      body: Center(
        child:Text(widget._title) ,
      ),
    );
  }
}