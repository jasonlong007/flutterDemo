import 'package:flutter/material.dart';

class SecondTabs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          // 让子元素居中
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.adb,
              size:160.0,
              color:Colors.green
            ),
            Text("第二个页面的tab内容")
          ],
        ),
      ),
    );
  }
}