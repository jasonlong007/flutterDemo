import 'package:flutter/material.dart';
import '../model/categoryGoodsList.dart';

// 创建一个sate状态
// with混入ChangeNotifier:可以不用管理听众，通过notifyListeners（）可以通知听众刷新
class CategoryGoodsListProvide with ChangeNotifier  {
  List<CategoryGoodsListData> goodsList=[];

  // 点击大类时更换商品列表
  getGoodsList(List<CategoryGoodsListData> list){
    goodsList=list;
    // 添加一个监听的方法
    notifyListeners();
  }

   // 点击大类时更换商品列表
  getMoreGoodsList(List<CategoryGoodsListData> list){
    goodsList.addAll(list);
    // 添加一个监听的方法
    notifyListeners();
  }
  
}