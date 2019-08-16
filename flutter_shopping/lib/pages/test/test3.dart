import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../service/service_medthod.dart';
import 'dart:convert';
import '../model/category.dart';


class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}


class _CategoryPageState extends State<CategoryPage> {
  @override
void initState() { 
  super.initState();
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('商品分类'),),
      body: Container(
        child: Row(
          children: <Widget>[
            LeftCategoryNav()
          ],
        ),
      ),
    );
  }



}

// 左侧动态菜单创立

class LeftCategoryNav extends StatefulWidget {
  @override
  _LeftCategoryNavState createState() => _LeftCategoryNavState();
}

class _LeftCategoryNavState extends State<LeftCategoryNav> {
  List<Data> list=[];
    // var listIndex = 0; //索引

   @override
void initState() { 
  _getCategory();
  super.initState();
  
}

  @override
  Widget build(BuildContext context) {
//  _getCategory();
    return Container(
      width: ScreenUtil().setWidth(180),
      decoration: BoxDecoration(
        border: Border(right: BorderSide(width: 1,color: Colors.black12))),
      child: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context,index){
        return _lefInWel(index);
        },
      ),
    );
  }

  


  //编写大类子项
  Widget _lefInWel(int index){
     return InkWell(
       onTap: (){

       },
       child: Container(
        height: ScreenUtil().setHeight(100.0),
        padding: EdgeInsets.only(left: 10, top: 20),
         decoration: BoxDecoration(
           color: Colors.white,
           border: Border(
             bottom: BorderSide(width: 1,color: Colors.black12)
           )
         ),
          child: Text(
            list[index].mallCategoryName,
            style: TextStyle(fontSize:ScreenUtil().setSp(28),
            // color: isClick ? Colors.white : Colors.black
            )
            ),
       ),
     );
  } 

  // 创建一个内部方法请求解决接口
  void _getCategory() async {
      await request('getCategory').then((val) {
      var data = json.decode(val.toString());
      CategoryModel category = CategoryModel.fromJson(data);
      setState(() {
        list = category.data;
      });
    });
  }

}
