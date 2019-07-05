import 'package:flutter/material.dart';

// 定义全局变量
const double _kTextAndIconTabHeight=53.0;
const double _kMarginMottom=3.0;

class IconTab extends StatefulWidget {
  // 构造函数
  const IconTab({
    Key key,
    this.text,
    this.icon,
    this.color
  }):assert(text !=null||icon !=null||color !=null),super(key :key);
   
   final String text;
   final String icon;
   final Color color;

  @override
  _IconTabState createState() => _IconTabState();
}

class _IconTabState extends State<IconTab> {
// 构建文本
/*
MainAxisAlignment（主轴）就是与当前控件方向一致的轴，而CrossAxisAlignment（交叉轴）就是与当前控件方向垂直的轴

在水平方向控件中，例如Row
MainAxisAlignment是水平的，默认起始位置在左边，排列方向为从左至右，此时可以通过textDirection来改变MainAxisAlignment的起始位置和排列方向
CrossAxisAlignment是垂直的，默认起始位置在中间，排列方向为从上至下，此时可以通过verticalDirection来改变CrossAxisAlignment的起始位置及排列方向

在垂直方向的控件中，例如Column
MainAxisAlignment是垂直的，默认起始位置在上边，排列方向为从上至下，此时可以通过verticalDirection来改变MainAxisAlignment的起始位置及排列方向
CrossAxisAlignment是水平的，默认起始位置在中间，此时可以通过textDirection来改变CrossAxisAlignment的起始位置
 */

Widget _buildLabelText(){
return Text(
  widget.text,
  overflow: TextOverflow.fade,
  style: TextStyle(color: widget.color),
);
}


  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMaterial(context));
    
    double height=_kTextAndIconTabHeight;
    Widget label=new Column(
      mainAxisAlignment: MainAxisAlignment.center,//MainAxisAlignment
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
       Container(
         child: Image(
           image: AssetImage(widget.icon),
           height: 30.0,
           width: 30.0,
         ),
         margin: const EdgeInsets.only(bottom: _kMarginMottom),
       ),
       _buildLabelText()
      ],
    );
    

    return SizedBox(
      height: height,
      child: Center(
        child: label,
        widthFactor: 1.0,
      ),
    );
  }
}