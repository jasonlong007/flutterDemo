import 'package:flutter/material.dart';
import 'package:handling_routes/screens/about.dart';
import 'package:handling_routes/screens/home.dart';

void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'routes',
      // home 隐含路由设置为/
      home: HomePage(),
      // 构建一个路由
      routes: <String,WidgetBuilder>{
        //设置命名路由
        AboutPage.routeName:(BuildContext context){
          return AboutPage();
        }
      },
      
    );
  }
}