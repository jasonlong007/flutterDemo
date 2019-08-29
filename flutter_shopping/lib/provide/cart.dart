import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../model/cartInfo.dart';

class CartProvide with ChangeNotifier {
   
  //  声明一个字符串变量
  String cartString='[]';
  List<CartInfoModel> cartList=[];
  
  // 制作把商品添加到购物车的方法
  // 
  save(goodsId,goodsName,count,price,images) async {
      //  初始化持久化组件
      SharedPreferences prefs= await SharedPreferences.getInstance();
      // 获取持久化存储的值
      cartString=prefs.getString('cartInfo');
      // 判断cartString是否为空，为空说明是第一次添加，或者被key被清除了
      // 如果有值的进行decode操作
      var temp=cartString==null?[]:json.decode(cartString.toString());
      // 把获得值转变成list
      List<Map> tempList=(temp as List).cast();
      // 声明变量，用于判断购物车是否已经存在此商品ID
      bool isHave=false;//默认为没有
      int ival=0;//用于进行循环的索引使用
      tempList.forEach((item){//进行循环，找出是否已经存在改商品
          if (item['goodsId']==goodsId) {
             tempList[ival]['count']=item['count']+1;
             cartList[ival].count++;
             isHave=true;
          }
          ival++;
      });
      // 如果没有，进行增加
      if (!isHave) {
        Map<String,dynamic> newGoods={
          'goodsId':goodsId,
          'goodsName':goodsName,
          'count':count,
          'price':price,
          'images':images
        };
        tempList.add(newGoods);
        cartList.add(new CartInfoModel.fromJson(newGoods));
      }

      // 把字符串进行encode操作
      cartString=json.encode(tempList).toString();
      print('字符串》》》》》》》》》》》》》》》》》》》》${cartString}');
        print('数据模型》》》》》》》》》》》》》》》》》》》》${cartList}');
      prefs.setString('cartInfo', cartString);
     
      notifyListeners();

  }

  remove() async{
     //  初始化持久化组件
      SharedPreferences prefs= await SharedPreferences.getInstance();
      prefs.remove('cartInfo');
      cartList=[];
      print('清楚完成*******************');
      notifyListeners();
  }

  // 得到购物车的商品
  getCartInfo() async{
    //  初始化持久化组件
      SharedPreferences prefs= await SharedPreferences.getInstance();
      // 获得购物车中的商品，这时候是一个字符串
      cartString=prefs.getString('cartInfo');
      // 把cartInfo进行初始化，防止数据混乱
      cartList=[];
      // 判断得到字符串是否有值，如果不判断会报错
      if (cartString==null) {
        cartList=[];
      } else {
        List<Map> tempList=(json.decode(cartString.toString()) as List).cast();
        tempList.forEach((item){
             cartList.add(CartInfoModel.fromJson(item));
        });
      }
      notifyListeners();
  }

}
