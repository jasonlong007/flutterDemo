import 'package:flutter/material.dart';
import './app/component/icon_tab.dart';

class BossApp extends StatefulWidget {
  @override
  _BossAppState createState() => _BossAppState();
}


// 是指常量
const double _kTabTextSize=11.0;
const int INDEX_JOB1=0;
const int INDEX_JOB2=1;
const int INDEX_JOB3=2;
const int INDEX_JOB4=3;
Color _kPrimaryColor=new Color.fromARGB(25, 0, 215, 198);

// Tab页的切换搭配了动画，因此要到State类上附加一个SingleTickerProviderStateMixin
class _BossAppState extends State<BossApp> with SingleTickerProviderStateMixin{

 int _carrentIndex=0;
//  tab控制器
TabController _controller;
VoidCallback onChanged;


  @override
  void initState() {
   
    super.initState();
    _controller=new TabController(initialIndex: _carrentIndex,length: 4,vsync: this);
    onChanged=(){
    setState(() {
     _carrentIndex=this._controller.index; 
    });
    };

    _controller.addListener(onChanged);
  }
 @override
  void dispose() {

    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        children: <Widget>[],
        controller: _controller,
      ),
      bottomNavigationBar: Material(
        color: Colors.white,
        child: TabBar(
          tabs: <IconTab>[
             new IconTab(
               icon:_carrentIndex==INDEX_JOB1
               ?"assets/images/Home2.png"
               :"assets/images/Home1.png",
               text:"首页",
               color:_carrentIndex==INDEX_JOB1?_kPrimaryColor : Colors.grey[900]
             ),
              new IconTab(
               icon:_carrentIndex==INDEX_JOB2
               ?"assets/images/Faxian2.png"
               :"assets/images/Faxian1.png",
               text:"公司",
               color:_carrentIndex==INDEX_JOB2?_kPrimaryColor : Colors.grey[900]
             ),
              new IconTab(
               icon:_carrentIndex==INDEX_JOB3
               ?"assets/images/Shoucang2.png"
               :"assets/images/Shoucang1.png",
               text:"消息",
               color:_carrentIndex==INDEX_JOB3?_kPrimaryColor : Colors.grey[900]
             ),
              new IconTab(
               icon:_carrentIndex==INDEX_JOB4
               ?"assets/images/my2.png"
               :"assets/images/my1.png",
               text:"我的",
               color:_carrentIndex==INDEX_JOB4?_kPrimaryColor : Colors.grey[900]
             ),
          ],
        ),
      ),
    );
  }
}