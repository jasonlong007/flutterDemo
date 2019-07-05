import 'package:flutter/material.dart';

class ToolTipDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('tool tips demo'),),
      body: Center(
        child: Tooltip(
          message: "提示信息，不要唱了",
          child: Image.network('https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1559557668186&di=7ef1b359f031a6f39c5d0c82fd15f97b&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201805%2F11%2F20180511062954_wcshp.jpg'),
        ),
      ),
    );
  }
}