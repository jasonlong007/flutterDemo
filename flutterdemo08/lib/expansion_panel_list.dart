import 'package:flutter/material.dart';

class ExapansionPaneListDemo extends StatefulWidget {
  @override
  _ExapansionPaneListDemoState createState() => _ExapansionPaneListDemoState();
}

class _ExapansionPaneListDemoState extends State<ExapansionPaneListDemo> {
  List<int> mList;
  List<ExpandStateBean> expandStateList;
  // 构建一个内部使用的构造方法
  _ExapansionPaneListDemoState(){
    // 调用这个方法的时候，对两个变量初始化
    mList=new List();
    expandStateList=new List();
    for (int i = 0; i < 10; i++) {
      mList.add(i);
      expandStateList.add(ExpandStateBean(i,false));
    }
  }

  // 申明一个内部的方法
  _setCurrentIndex(int index,isExpand){
   setState(() {
    expandStateList.forEach((item){
      // 把传过来的索引与当前做一个比较
      if (item.index==index) {
        // 相当于取反操作进行闭合和开启
        item.isOpen=!isExpand;
      }
    }); 
   });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('expansion panel list'),),
      body: SingleChildScrollView(//expansion这个控件必须放在SingleChildScrollView控件里面
       child: ExpansionPanelList(
         //回调方法
         expansionCallback: (index,bol){
             _setCurrentIndex(index,bol);
         },
         children: mList.map((index){//转化成List
             return ExpansionPanel(
               headerBuilder: (context,isExpanded){
                 return ListTile(
                   title: Text('This is No.$index',style: TextStyle(color: Colors.blue)),
                   
                 );
               },
               body: ListTile(
                 title: Text('expansion No.$index'),
               ),
               isExpanded:expandStateList[index].isOpen
             );
         }).toList(),
       ),
      ),
    );
  }
}

// 构建闭合开关的类
class ExpandStateBean {
  var isOpen;
  var index;

  ExpandStateBean(this.index,this.isOpen);
}