import 'package:flutter/material.dart';

class ThirdTabs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          // 让子元素居中
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.airport_shuttle,
              size:160.0,
              color:Colors.blue
            ),
            Text("第三个页面的tab内容")
          ],
        ),
      ),
    );
  }
}