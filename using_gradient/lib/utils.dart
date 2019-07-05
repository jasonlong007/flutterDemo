import 'package:flutter/material.dart';

LinearGradient getCustomGradient(){

  // 定义一个线性渐变
  return LinearGradient(
    colors: [Colors.pink,Colors.blue],
    begin: const FractionalOffset(0.0, 1.0),
    end: const FractionalOffset(1.0, 0.0),
    stops: [0.1,0.5],
    tileMode: TileMode.clamp
  );
}