import 'package:flutter/material.dart';
import 'bottom_navigation_bar.dart';
void main()=>runApp(new MyAppp());

class MyAppp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter bottomNavigationBar',
      theme: ThemeData.light(),//皮肤
      home: BottomNavgationWidget(),
    );
  }
}

