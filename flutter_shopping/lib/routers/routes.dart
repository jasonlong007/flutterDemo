import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import './router_handler.dart';

class Routes {
  static String root='/';
  static String detailsPage='/detail';
  static String test1='/test1';
  //配置购物车路由
  static String cartPage='/cartPage';

  static void configureRoutes(Router router){
    // 判断没有找到路由的时候判断
    router.notFoundHandler=new Handler(
      handlerFunc: (BuildContext context,Map<String,List<String>> params){
        print('ERRR404');
      }
    );
    // 配置路由
    router.define(detailsPage,handler:detailsHander );
    router.define(test1,handler: test);
    router.define(cartPage,handler: cartHander);
  }

}