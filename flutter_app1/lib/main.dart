import 'package:flutter/material.dart'; //引入Ui组件库

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'JasonLong flutter',
        home: Scaffold(
            appBar: new AppBar(title: new Text('ListView Widget')),
            body:GridView(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,//显示一行多少列
                mainAxisSpacing: 3.0,//列上下间距
                crossAxisSpacing: 3.0,//列的左右间隔
                childAspectRatio: 0.7//宽和高的比例
              ),
              children: <Widget>[
                new Image.network('http://img5.mtime.cn/mg/2019/05/09/154534.35950592_170X256X4.jpg',fit: BoxFit.cover,),
                new Image.network('http://img5.mtime.cn/mg/2019/05/15/105946.94601629_170X256X4.jpg',fit: BoxFit.cover,),
                new Image.network('http://img5.mtime.cn/mg/2019/03/29/095612.14234221_170X256X4.jpg',fit: BoxFit.cover,),
                new Image.network('http://img5.mtime.cn/mg/2019/04/19/101040.92560167_126X190X4.jpg',fit: BoxFit.cover,),
                new Image.network('http://img5.mtime.cn/mg/2019/01/30/152307.77354514_1280X720X2.jpg',fit: BoxFit.cover,),
                new Image.network('http://img5.mtime.cn/mg/2019/03/29/162239.92284604_1280X720X2.jpg',fit: BoxFit.cover,),
                new Image.network('http://img5.mtime.cn/mg/2019/03/01/142659.41475827_1280X720X2.jpg',fit: BoxFit.cover,),
              ],
            )
            )
          );
  }
}
