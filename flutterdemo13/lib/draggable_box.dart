import 'package:flutter/material.dart';

class DraggbleWiget extends StatefulWidget {
  // 定义两个变量
  final Offset offset;
  final Color widgetColor;
  // 初始化，可以接受传递参数
  const DraggbleWiget({Key key,this.offset,this.widgetColor}):super(key:key);

  @override
  _DraggbleWigetState createState() => _DraggbleWigetState();
}

class _DraggbleWigetState extends State<DraggbleWiget> {
 Offset offset=Offset(0.0, 0.0);
 
//  初始化
@override
  void initState() {
    
    super.initState();
    offset=widget.offset;
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: offset.dx,
      top: offset.dy,
      child: Draggable(
        data: widget.widgetColor,
        child: Container(
          width: 100.0,
          height: 100.0,
          color: widget.widgetColor,
        ),
        feedback: Container(//拖拽的时候
          width: 100.0,
          height: 100.0,
          color: widget.widgetColor.withOpacity(0.5),
          
        ),
        onDraggableCanceled: (Velocity velocity,Offset offset){//不拖拽的时候
        //  改变状态的时候用setState
        setState(() {
         this.offset=offset; 
        });
        },
      ),
    );
  }
}