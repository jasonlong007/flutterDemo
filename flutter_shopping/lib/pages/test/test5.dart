import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import 'package:shared_preferences/shared_preferences.dart';



class CartPage extends StatefulWidget {
  CartPage({Key key}) : super(key: key);

  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<String> testList=[];


  @override
  Widget build(BuildContext context) {
    _show();
    return Container(
       child: Column(
         children: <Widget>[
           Container(
             height: 500,
             child: ListView.builder(
               itemCount: testList.length,
               itemBuilder: (BuildContext context, int index) {
               return ListTile(
                 title: Text(testList[index]),
               );
              },
             ),
           ),
           RaisedButton(
             onPressed: (){_add();},
             child: Text('增加'),
           ),
           RaisedButton(
             onPressed: (){_clear();},
             child: Text('清除'),
           )
         ],
       ),
    );
  }

  // 增加方法
  void _add() async{
    // 申明并初始化持久化组件
    SharedPreferences  prefs=await SharedPreferences.getInstance();
    String temp="Jason Long";
    testList.add(temp);
    prefs.setStringList('testInfo', testList);
    _show();
  }
  // 查询
  void _show() async{
    SharedPreferences  prefs=await SharedPreferences.getInstance();
    if (prefs.getStringList('testInfo')!=null) {
      setState(() {
       testList= prefs.getStringList('testInfo');
      });
    }
  }

  // 删除
   void _clear() async{
    SharedPreferences  prefs=await SharedPreferences.getInstance();
    prefs.remove('testInfo');
    setState(() {
     testList=[]; 
    });
  }

}