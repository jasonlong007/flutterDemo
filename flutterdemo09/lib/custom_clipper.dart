
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          ClipPath(
            clipper: BottomClipperTest(),
            child: Container(
              color: Colors.deepPurpleAccent,
              height: 200.0,
              width: 750.0,
              child: Center(
                child: Text("贝塞尔曲线",style: TextStyle(color: Colors.white))
              ),
            ),
          )
        ],
      ),
    );
  }
}

// 绘制波浪形曲线

class BottomClipperTest extends CustomClipper<Path>{

@override
    Path getClip(Size size) {
     var path= Path();
    //  第一个点
    path.lineTo(0, 0);
    // 第二个点
    path.lineTo(0, size.height-40);
    // 第一个贝塞尔曲线开始点
    var firstControlPoint=Offset(size.width/4, size.height);
    var firstEndPoint=Offset(size.width/2.25, size.height-30);
    //  传入生成一个贝塞尔曲线
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,firstEndPoint.dx , firstEndPoint.dy);

    // 第二贝塞尔曲线控制点
    var secondControlPoint=Offset(size.width*0.75,size.height-90);
    var secondEndPoint=Offset(size.width, size.height-30);
    // c传入生成第二贝塞尔曲线
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy, secondEndPoint.dx, secondEndPoint.dy);
   
    // 绘制第三个点
    path.lineTo(size.width, size.height-60);
    // 绘制第四个点
    path.lineTo(size.width, 0);
    return path;

    }
  // 
  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    
    return false;
  }
}

// 绘制贝塞尔曲线
class BottomClipper extends CustomClipper<Path>{
  // 重写继承的方法
//   @override
//   Path getClip(Size size){
//   // 申明一个返回的路径
//    var path=Path();
//   //  左上角的点
//   path.lineTo(0, 0);
//   // 左下角
//   path.lineTo(0, size.height-50);
//   // 控制点
//   var firstContronPoint=Offset(size.width/2, size.height);
//   // 第一个结束点
//   var firstEndPoint=Offset(size.width, size.height-50);
//   path.relativeQuadraticBezierTo(firstContronPoint.dx, firstContronPoint.dy, firstEndPoint.dx, firstEndPoint.dy);
// //  第三个点：右下角
//   path.lineTo(0, size.height-50);
//   // 第四个点：右上角
//   path.lineTo(size.width, 0);
//   return path;
//   }
@override
    Path getClip(Size size) {
      var path = Path();
      path.lineTo(0, 0);
      path.lineTo(0, size.height-50);
      var firstControlPoint =Offset(size.width/2,size.height);
      var firstEndPoint = Offset(size.width,size.height-50);

      path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy, firstEndPoint.dx, firstEndPoint.dy);

      path.lineTo(size.width, size.height-50);
      path.lineTo(size.width, 0);
    
      return path;

    }
  // 
  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    
    return false;
  }
}