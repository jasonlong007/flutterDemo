import 'package:flutter/material.dart';
import 'home_page.dart';
 class SplashScreen extends StatefulWidget {
   @override
   _SplashScreenState createState() => _SplashScreenState();
 }
 
 class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  //  申明一个动画的控制器
  AnimationController _controller;
  Animation _animation;

  // 初始化状态
  @override
  void initState() {
    super.initState();
    _controller=AnimationController(vsync: this,duration: Duration(milliseconds: 3000));
    _animation=Tween(begin: 0.0,end: 1.0).animate(_controller);
    // 监听事件
    /*
    动画事件监听器，它可以监听到动画的执行状态，这里监听动画是否结束，如果结束则执行页面跳转动作
     */
    _animation.addStatusListener((status){
      // 当status等于AnimationStatus.completed进行路由跳转
     if (status==AnimationStatus.completed) {
       Navigator.of(context).pushAndRemoveUntil(
         MaterialPageRoute(builder: (context)=>MyHomePage())
         , 
         (route) =>route==null
         );
     }
    });

    // 播放动画设置
    _controller.forward();
  }
  // 销毁
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

   @override
   Widget build(BuildContext context) {
     return FadeTransition(//透明度动画组件
       opacity: _animation,//执行动画
       child: Image.network(//网络图片
         'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1546851657199&di=fdd278c2029f7826790191d59279dbbe&imgtype=0&src=http%3A%2F%2Fimg.zcool.cn%2Fcommunity%2F0112cb554438090000019ae93094f1.jpg%401280w_1l_2o_100sh.jpg',
         scale: 2.0,//进行缩放
         fit: BoxFit.cover,
       ),
     );
   }
 }