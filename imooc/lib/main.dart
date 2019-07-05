import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    title:'页面跳转返回数据',
    home:FirstPage()
  ));
}

class FirstPage extends StatelessWidget {
  // const name({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title:Text('找小姐姐要电话')),
     body: Center(
       child:RouteButton(),
     ),
    );
  }
}

class RouteButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(//按钮组件
      onPressed:(){_navgateToJie(context);},
      child:Text('去找小姐姐')
    );
  }
  // 创建一个方法 下划线代表内部方法
  // async异步操作
  _navgateToJie(BuildContext context) async{
    // 异步 请求：await
  final result=await Navigator.push(
    context,
    MaterialPageRoute(
      builder:(context)=>Xiaojie()
    ) 
  );
  Scaffold.of(context).showSnackBar(SnackBar(content: Text('$result')));
  }
}

class Xiaojie extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("我是小姐姐")
      ),
      body: Center(
        child:Column(
          children: <Widget>[
            // new Image.network('https://cdn.jsdelivr.net/gh/flutterchina/website@1.0/images/homepage/header-illustration.png'),
            new Expanded(
                //  child:Image.asset("images/a_dot_ham.jpeg",width:500,height:50) ,
                child: Text('小姐姐'),
              ),
             Expanded(child: RaisedButton(
              child:Text('大厂的厂花'),
              onPressed:(){
                Navigator.pop(context,'厂花电话为：1511111111');
              }
            )
            ),
            Expanded(child: RaisedButton(
              child:Text('大厂的水蛇腰'),
              onPressed:(){
                Navigator.pop(context,'大厂的水蛇腰：1512222222');
              }
            )
            ),
            Expanded(child: RaisedButton(
              child:Text('大厂的嫂嫂'),
              onPressed:(){
                Navigator.pop(context,'嫂嫂电话为：151888888');
              }
            )
            ),
            Expanded(child: RaisedButton(
              child:Text('大厂的二嫂'),
              onPressed:(){
                Navigator.pop(context,'二嫂电话为：151888888');
              }
            )
            ),
            
          ],
        ),
      ),
    );
  }
}