import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../model/cartInfo.dart';

class CartProvide with ChangeNotifier {
   
  //  声明一个字符串变量
  String cartString='[]';
  List<CartInfoModel> cartList=[];
  double allPrice=0;//总价格
  int allGoodsCount=0;//总数量
  bool isAllCheck= true; //是否全选

  
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
      // 为了添加在商品香苑购物车数量变化的时候需要进行初始化数量和价格
      allGoodsCount=0;
      allPrice=0;
      tempList.forEach((item){//进行循环，找出是否已经存在改商品
          if (item['goodsId']==goodsId) {
             tempList[ival]['count']=item['count']+1;
             cartList[ival].count++;
             isHave=true;
          }

          // 对在商品详情页中添加购物车的时候显示复选框选中的数量
          if (item['isCheck']) {
            allPrice +=(cartList[ival].price*cartList[ival].count);
            allGoodsCount +=cartList[ival].count;
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
          'images':images,
          'isCheck':true
        };
        tempList.add(newGoods);
        cartList.add(new CartInfoModel.fromJson(newGoods));

        // 没有商品的时候
        allGoodsCount +=count;
        allPrice +=(count*price);
      }

      // 把字符串进行encode操作
      cartString=json.encode(tempList).toString();
      // print('字符串》》》》》》》》》》》》》》》》》》》》${cartString}');
      //   print('数据模型》》》》》》》》》》》》》》》》》》》》${cartList}');
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
        // 初始化数量和总价格
        allGoodsCount=0;
        allPrice=0;
        isAllCheck=true;
        tempList.forEach((item){
          // 判断是否是选中状态
          if (item['isCheck']) {
             allPrice+=(item['count']*item['price']);
             allGoodsCount+=item['count'];
          }else{
             isAllCheck=false;
          }
             cartList.add(CartInfoModel.fromJson(item));
        });
      }
      notifyListeners();
  }


  //删除单个购物车商品
  deleteOneGoods(String goodsId) async{
     //  初始化持久化组件
      SharedPreferences prefs= await SharedPreferences.getInstance();
      cartString=prefs.getString('cartInfo');
      // 转换成List<map>
      List<Map> tempList=(json.decode(cartString.toString()) as List).cast();
      // 循环索引
      int tempIndex=0;
      // 删除索引
      int delIndex=0;
      // 循环比较找到需求删除的
      tempList.forEach((item){
        //  判断goodsId
        if (item['goodsId']==goodsId) {
          delIndex=tempIndex;
        }
        tempIndex++;
      });

      // 进行删除
      tempList.removeAt(delIndex);
      // 要进行持久化操作
      cartString=json.encode(tempList).toString();
      prefs.setString('cartInfo', cartString);
      // 刷新列表
      await getCartInfo();

  } 


  //选择复选框
  changeCheckState(CartInfoModel cartItem) async{
         //  初始化持久化组件
      SharedPreferences prefs= await SharedPreferences.getInstance();
      cartString=prefs.getString('cartInfo');
      // 转换成List<map>
      List<Map> tempList=(json.decode(cartString.toString()) as List).cast();
      // 循环索引
      int tempIndex=0;
      // 复选索引
      int changeIndex=0;
      tempList.forEach((val){
        // 
        if (val['goodsId']==cartItem.goodsId) {
          changeIndex=tempIndex;
        }
        tempIndex++;
      });
      // 把对象变成MAP值
      tempList[changeIndex]=cartItem.toJson();
      cartString=json.encode(tempList).toString();//把变成字符串
      // 进行持久化
      prefs.setString('cartInfo', cartString);
      await getCartInfo();//重新读取列表

  }


// 点击全选按钮操作
  changeAllCheckBtnState(bool isCheck) async{
         //  初始化持久化组件
      SharedPreferences prefs= await SharedPreferences.getInstance();
      cartString=prefs.getString('cartInfo');
      // 转换成List<map>
      List<Map> tempList=(json.decode(cartString.toString()) as List).cast(); 
      // 创建一个新的list，用于组成新的持久化数据。
      List<Map> newList=[];
      for (var item in tempList) {
         var newItem=item;//复制新的变量，因为dart语言不让循环中修改原值
         newItem['isCheck']=isCheck;//改变选中的状态
         newList.add(newItem);
      }
       cartString=json.encode(newList).toString();//把变成字符串
      // 进行持久化
      prefs.setString('cartInfo', cartString);
      await getCartInfo();//重新读取列表
  }

  // 商品数量加减
  addOrReduceAction(var cartItem,String todo) async{
     //  初始化持久化组件
      SharedPreferences prefs= await SharedPreferences.getInstance();
      cartString=prefs.getString('cartInfo');
      // 转换成List<map>
      List<Map> tempList=(json.decode(cartString.toString()) as List).cast();
       // 循环索引
      int tempIndex=0;
      // 复选索引
      int changeIndex=0;
      tempList.forEach((item){
        if (item['goodsId']==cartItem.goodsId) {
          changeIndex=tempIndex;
        }
        tempIndex++;
      });

      // 判断加还是减操作
      if (todo=='add') {
        cartItem.count++;
      }else if(cartItem.count>1){
        cartItem.count--;
      }

      // 以下是进行持久化操作
      tempList[changeIndex]=cartItem.toJson();// 把对象变成MAP值
      cartString=json.encode(tempList).toString();//转换成字符串
      prefs.setString('cartInfo', cartString);//持久化操作
      await getCartInfo();


  }


}
