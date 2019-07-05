import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter_boss/home.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  // 定义时间
  Timer _timer;
  @override
  void initState() {
    super.initState();
    _timer=new Timer(const Duration(milliseconds:1500), (){
     
     try {
         Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
       builder:(BuildContext context)=>new BossApp()), 
       (Route route )=>route ==null);
     } catch (e) {
       
     }

   
     
    });
  }
 
 @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color.fromARGB(255, 0, 215, 198),
      child: Padding(
        padding: const EdgeInsets.only(top: 150.0),
        child: Column(
          children: <Widget>[
            Text("BOSS直聘",style: TextStyle(fontSize: 50.0,fontWeight: FontWeight.bold,color: Colors.white),)
          ],
        ),
      ),
    );
  }
}