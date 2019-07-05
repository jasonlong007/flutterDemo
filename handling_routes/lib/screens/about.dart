import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class HomePage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        backgroundColor: Colors.red,
      ),
      body: Container(
        child: Center(
          child: Column(
            // 列中的中心内容
            mainAxisAlignment: MainAxisAlignment.center,
            // 将子项添加到列中
            children: <Widget>[
              Text(
                'Home Page \n 点击下面的图标进入关于',
                style:TextStyle(fontSize:20.0),
                textAlign:TextAlign.center
              ),
              IconButton(
                icon: Icon(
                  Icons.home,
                  color:Colors.red
                ),
                onPressed: (){
                  // 使用导航器跳转到命名的路由
                  Navigator.of(context).pushNamed('/about');
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