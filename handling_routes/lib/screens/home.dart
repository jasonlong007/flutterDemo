import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class AboutPage extends StatelessWidget {
  static const String routeName="/about";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About Page"),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        child: Center(
          child: Column(
            // 列中的中心内容
            mainAxisAlignment: MainAxisAlignment.center,
            // 将子项添加到列中
            children: <Widget>[
              Text(
                'About Page \n 点击下面的图标进入首页',
                style:TextStyle(fontSize:20.0),
                textAlign:TextAlign.center
              ),
              IconButton(
                icon: Icon(
                  Icons.account_box,
                  color:Colors.red
                ),
                onPressed: (){
                  // 使用导航器跳转到命名的路由
                  Navigator.of(context).pushNamed('/');
                },
                iconSize: 80.0,
              )
            ],
          ),
        ),
      ),
    );
  }
}