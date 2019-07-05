import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'draggable_box.dart';

class DraggableDemo extends StatefulWidget {
  @override
  _DraggableDemoState createState() => _DraggableDemoState();
}

class _DraggableDemoState extends State<DraggableDemo> {
  // 重新定义一下颜色变量
  Color _draggbleColor=Colors.green;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(//可重叠的控件
       children: <Widget>[
         DraggbleWiget(
           offset: Offset(80.0,80.0),
           widgetColor: Colors.tealAccent,
         ),
         DraggbleWiget(
           offset: Offset(180.0,80.0),
           widgetColor: Colors.blue,
         ),
         Center(//拖拽接收器
           child: DragTarget(
             onAccept:(Color color){//触发事件
              _draggbleColor=color;
             },builder: (context,candidateData,rejectedDate){
               return Container(
                width: 200.0,
                height: 200.0,
                color: _draggbleColor,
               );
             },
           ),
         )
       ],
      ),
    );
  }
}