import 'package:flutter/material.dart';
import 'keep_alive_demo.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: KeepAliveDemo()
    );
  }
}

class KeepAliveDemo extends StatefulWidget {
  @override
  _KeepAliveDemoState createState() => _KeepAliveDemoState();
}

// with混入
class _KeepAliveDemoState extends State<KeepAliveDemo> with SingleTickerProviderStateMixin {
  TabController _controller;
  // 重写初始化
  @override
  void initState() {
    
    super.initState();
    // 初始化
    _controller=TabController(length: 3,vsync: this);
  }
  // 重写销毁方法
  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(//脚手架
     appBar: AppBar(
       title: Text('keep Alive Demo'),
       bottom: TabBar(
         controller: _controller,
         labelColor: Colors.white,
         tabs: <Widget>[
           Tab(icon: Icon(Icons.directions_car)),
           Tab(icon: Icon(Icons.directions_transit)),
           Tab(icon: Icon(Icons.access_time)),
         ],
       ),
       
     ),
     body: TabBarView(
       controller: _controller,
       children: <Widget>[
        MyHomePage(),
        MyHomePage(),
        MyHomePage(),
       ],
     ),
    );
  }
}