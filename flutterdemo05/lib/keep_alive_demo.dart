import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with AutomaticKeepAliveClientMixin {
  // 声明计数
 int _couter=0;

 @override
 bool get wantKeepAlive=>true;

//  构建一个加加的函数
  void _incrementCounter()
  {
    // 调用初始化
    setState(() {
     _couter++; 
    });
  } 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,//居中对齐
          children: <Widget>[
            Text('点一次增加一个++'),
            Text(
              '$_couter',
              style: Theme.of(context).textTheme.display1,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
      onPressed: _incrementCounter,
      tooltip: '相加',
      child: Icon(Icons.add),
      foregroundColor: Colors.white,
      ),
    );
  }
}