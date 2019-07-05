import 'package:flutter/material.dart';

class FirstTabs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          // 让子元素居中
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.favorite,
              size:160.0,
              color:Colors.red
            ),
            Text("第一个页面的tab内容")
          ],
        ),
      ),
    );
  }
}