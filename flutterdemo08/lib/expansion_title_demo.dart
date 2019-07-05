import 'package:flutter/material.dart';

class ExpansionTitleDemo extends StatelessWidget {
  // const ExpansionTitleDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('expansion title demo'),
      ),
      body: Center(
        child: ExpansionTile(
          title: Text('ExpansionTitleDemo'),
          leading: Icon(Icons.ac_unit),
          backgroundColor: Colors.white12,//打开之后背景颜色
          children: <Widget>[
            ListTile(
              title: Text('科比'),
              subtitle: Text('一个神一样的男人'),
            )
          ],
          initiallyExpanded: true,//设置闭合还是开启
        ),
      ),
    );
  }
}