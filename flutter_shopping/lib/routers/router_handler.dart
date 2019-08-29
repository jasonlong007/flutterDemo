import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import '../pages/details_page.dart';
import '../pages/test/test1.dart';
import '../pages/cart_page.dart';

Handler detailsHander=Handler(
  handlerFunc: (BuildContext context,Map<String,List<String>> params){
    String goodsId=params['id'].first;//获取传递的ID
    print("index---商品ID---${goodsId}");
    return DetailsPage(goodsId);
  }
);

// 测试
Handler test=Handler(
handlerFunc: (BuildContext context,Map<String,List<String>> params){
    return HomePage1();
  }
);

// 购物车路由
Handler cartHander=Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>>params){
    return CartPage();
  }
);