import 'package:flutter/material.dart';

// 创建一个sate状态
// with混入ChangeNotifier:可以不用管理听众，通过notifyListeners（）可以通知听众刷新
class Counter with ChangeNotifier  {
  int value=0;
  increment(){
    value++;
    notifyListeners();
  }
}