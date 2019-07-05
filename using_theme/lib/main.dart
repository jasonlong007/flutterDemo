import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: MyHome(),
      theme: ThemeData(
        primarySwatch: Colors.pink,
        primaryColor: Colors.lightGreenAccent,
        backgroundColor: Colors.black12
      ),
    );
  }
}


class MyHome  extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('使用 theme'),
      ),
      body: Container(
        // 另外一种设置背景颜色的方法
        decoration: BoxDecoration(color: Colors.blue),
        
        child: Center(

          child: Container(
            // 使用主题强调颜色作为此窗口这个theme控件的背景颜色
            // color: Colors.black,
             color: Theme.of(context).accentColor,
            child: Text(
              "hello world",
                style: Theme.of(context).textTheme.title,
              // style:TextStyle(
              //   fontSize: 20.0,
              //   color: Colors.white
              // ),
              
              ),
              padding: const EdgeInsets.all(15.0),
          ),
        ),
      ),

      // floatingActionButton控件的使用
      floatingActionButton: Theme(
        //仅覆盖此窗口控件的主题的强调颜色
         data: Theme.of(context).copyWith(accentColor: Colors.pinkAccent),
         child: FloatingActionButton(
           onPressed: null,
           child: Icon(Icons.add),
         ),
      ),
    );
  }
}