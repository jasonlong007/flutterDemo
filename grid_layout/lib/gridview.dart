import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyGridView {
   Card getStructuredGridCell(name,image){
     return Card(
       elevation: 1.5,//设置阴影
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.stretch,//子孩子控件完全填充交叉轴方向的空间
         mainAxisSize: MainAxisSize.min,//在主轴方向占有空间的值，默认是maX：max:根据传入的布局约束条件，最大化主轴方向的可用空间
         verticalDirection: VerticalDirection.down,//表示所有的子控件都是从上到下顺序排序，如果为up则从底部开始向上倒序排序
         children: <Widget>[
           Image(
             image: AssetImage('data_repo/img/social/'+image),
           ),
           Center(
             child: Text(name),
           )
         ],
       ),
     );
   }

    
   GridView build() {
     return GridView.count(
       primary: true,//是否与父 PrimaryScrollController关联的主滚动视图
       padding: const EdgeInsets.all(1.0),
       crossAxisCount: 2,
       childAspectRatio: 0.85,
       mainAxisSpacing: 1.0,
       crossAxisSpacing: 1.0,
       children: <Widget>[
         getStructuredGridCell('Facebook', "facebook.png"),
         getStructuredGridCell("Twitter", "twitter.png"),
        getStructuredGridCell("Instagram", "instagram.png"),
        getStructuredGridCell("Linkedin", "linkedin.png"),
        getStructuredGridCell("Gooogle Plus", "google_plus.png"),
        getStructuredGridCell("Launcher Icon", "ic_launcher.png"),

       ],
     );
   }
}