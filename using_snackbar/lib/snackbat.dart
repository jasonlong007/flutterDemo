import 'package:flutter/material.dart';

class ContactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Using SnackBar'),
        
      ),
      body: Center(
        child: MyButton(),
      ),
    );
    
  }
}

// 创建按钮点击提示
class MyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text('Show SnackBar'),
      onPressed: (){
        // show snackbar
        Scaffold.of(context).showSnackBar(
          SnackBar(
            content: Text('hello 我是从底部弹出的sanckBar'),
            // 设置动画持续的时间
            duration: Duration(seconds: 3),
            // 设置动作
            action: SnackBarAction(
              label: "我点击了我",
              onPressed: (){
                // 按下操作按钮时候，显示另外一个小snackbar
                Scaffold.of(context).showSnackBar(
                SnackBar(
                  content: Text('hello I am show becoz you'),
                )
                );
              },
            ),
          )
        );
      },
    );
  }
}