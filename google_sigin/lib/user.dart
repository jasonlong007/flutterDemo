import 'package:flutter/material.dart';

class User extends StatelessWidget {
  VoidCallback onLogout;//定义一个没有参数且没有返回值的方法
  String username;
  FirebaseUser user;
  User({Key key,@required this.onLogout,@required this.user})
  :super(key:key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: this.onLogout,
          )
        ],
      ),
    );
  }
}