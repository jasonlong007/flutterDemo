import 'package:flutter/material.dart';
import 'pages/home_screen.dart';
import 'pages/email_screen.dart';
import 'pages/airplay_screen.dart';
import 'pages/pages_screen.dart';

class BottomNavgationWidget extends StatefulWidget {
  @override
  _BottomNavgationWidgetState createState() => _BottomNavgationWidgetState();
}

class _BottomNavgationWidgetState extends State<BottomNavgationWidget> {
  // 定义内部使用的变量 
  final _BottomNavgationColor=Colors.blue;
// 定义切换的当前的索引
  int _currentIndex=0;
  List<Widget> list=List();

  // 生命周期：重写初始化
  // initState：widget创建执行的第一个方法，可以再里面初始化一些数据，以及绑定控制器
 @override
 void initState(){
  //  ..add()
  // 建造模式
  list 
  ..add(HomeScreen())
  ..add(EmailScreen())
  ..add(PagesScreen())
  ..add(AirplayScreen());
  // 初始化方法
  super.initState();

 }
//  生命周期
// didChangeAppLifecycleState方法复写需要State with 
 @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print(state.toString());
  }

// didChangeDependencies：当State对象的依赖发生变化时会被调用；例如：在之前build() 中包含了一个InheritedWidget，然后在之后的build() 中InheritedWidget发生了变化，那么此时InheritedWidget的子widget的didChangeDependencies()回调都会被调用。InheritedWidget这个widget可以由父控件向子控件共享数据，案例可以参考 scoped_model开源库。

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print('didChangeDependencies');
  }
// didChangeDependencies：当State对象的依赖发生变化时会被调用；例如：在之前build() 中包含了一个InheritedWidget，然后在之后的build() 中InheritedWidget发生了变化，那么此时InheritedWidget的子widget的didChangeDependencies()回调都会被调用。InheritedWidget这个widget可以由父控件向子控件共享数据，案例可以参考 scoped_model开源库。
// build ：它主要是用于构建Widget子树的。
// reassemble：此回调是专门为了开发调试而提供的，在热重载(hot reload)时会被调用，此回调在Release模式下永远不会被调用。
// didUpdateWidget：当树rebuid的时候会调用该方法。
// deactivate:当State对象从树中被移除时，会调用此回调。
// dispose():当State对象从树中被永久移除时调用；通常在此回调中释放资源。




  @override
  Widget build(BuildContext context) {
    return Scaffold(//脚手架
    body: list[_currentIndex],//当前页面索引
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: _BottomNavgationColor,
              ),
              title: Text(
                'Home',
                style:TextStyle(color:_BottomNavgationColor)
                
                )
          ),
           BottomNavigationBarItem(
            icon: Icon(
              Icons.email,
              color: _BottomNavgationColor,
              ),
              title: Text(
                'Email',
                style:TextStyle(color:_BottomNavgationColor)
                
                )
          ),
           BottomNavigationBarItem(
            icon: Icon(
              Icons.pages,
              color: _BottomNavgationColor,
              ),
              title: Text(
                'Pages',
                style:TextStyle(color:_BottomNavgationColor)
                
                )
          ),
           BottomNavigationBarItem(
            icon: Icon(
              Icons.airplay,
              color: _BottomNavgationColor,
              ),
              title: Text(
                'Airplay',
                style:TextStyle(color:_BottomNavgationColor)
                
                )
          )
        ],
        currentIndex: _currentIndex,//哪个值高亮了哪个值被选中
        onTap: (int index){//点击响应事件
        // setState(){}的调用时吧视图重新绘制了一遍，但是并不是把整个视图diss掉再从新绘制。而是调用了build方法，绘制只是绘制不一样的地
          setState(() {
           _currentIndex=index; 
          });
        },
      ),
    );
  }
}