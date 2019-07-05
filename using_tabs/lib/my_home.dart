import 'package:flutter/material.dart';
import 'package:using_tabs/tabs/first_tabs.dart';
import 'tabs/second_tabs.dart';
import 'tabs/third_tabs.dart';

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

// 用with混入SingleTickerProviderStateMixin用于动画
class _MyHomeState extends State<MyHome> with SingleTickerProviderStateMixin{
  // 建立tabs

  // 创建一个tab控制器
  TabController _controller;

  // 初始化
  @override
  void initState() {
    super.initState();
    // 初始化tab控制器
    _controller= new TabController(length: 3,vsync: this);
  }

  // 销毁
  @override
  void dispose() {
    // 销毁tab控制器
   _controller.dispose();
    super.dispose();
  }
  
  TabBar getTabBar(){
    return TabBar(
      tabs: <Tab>[
        Tab(
          icon: Icon(Icons.favorite),
        ),
        Tab(
          icon: Icon(Icons.adb),
        ),
        Tab(
          icon: Icon(Icons.airport_shuttle),
        )
      ],
      // 设置控制器
      controller: _controller,
    );
  }

  TabBarView geTabBarView(var tabs){
    return TabBarView(
      // 将tabs添加控件
      children: tabs,
      controller: _controller,
    );
  }


// 通过在正文中设置tabs来设置页面
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Using Tabs'),
        backgroundColor: Colors.blue,
        // 设置appbar的bottom属性包含tabVar
        bottom: getTabBar(),
        
      ),
      // 将标签栏视图设置为脚手架的主体
      body: geTabBarView(
        <Widget>[FirstTabs(),SecondTabs(),ThirdTabs()]
      ),
    );
  }
}