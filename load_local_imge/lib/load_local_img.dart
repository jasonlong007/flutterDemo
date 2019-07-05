import 'package:flutter/material.dart';

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Load load 本地图片"),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              Text('Jason'),
              Image.asset('aseet/images/Chrysanthemum.jpg'),
              Image.asset('aseet/images/Koala.jpg')
            ],
          ),
          
        ),
        // 
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('aseet/images/bg1.jpg'),
            fit: BoxFit.cover
          )
        ),
      ),
    );
  }
}