import 'package:flutter/material.dart';
import '../model/details.dart';
import '../service/service_medthod.dart';
import 'dart:convert';

class DetailsInfoProvide with ChangeNotifier {
 
   DetailsModle goodsInfo=null;
  // 增加两个变量用来控制tab被选中
  bool isLeft=true;
  bool isRight=false;

  // 改变tabBar的状态
  changLeftAndRight(String changeState){
    if (changeState=='left') {
        isLeft=true;
        isRight=false;
    } else {
        isLeft=false;
        isRight=true;
    }
      notifyListeners();
  }
  
  //  从后台获取商品数据
  getGoodsInfo(String id) async {
    // 定义一个 请求参数
    var formData={'goodId':id};
   await request('getGoodDetailById',formData: formData).then((val){
       var resData=json.decode(val.toString());
       goodsInfo=DetailsModle.fromJson(resData);
       notifyListeners();
    });
  }

}

