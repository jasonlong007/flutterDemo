import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provide/provide.dart';
import '../../provide/details_info.dart';//详情页状态管理
import 'package:flutter_screenutil/flutter_screenutil.dart';//适配包

class DatailsTopArea extends StatelessWidget {
  const DatailsTopArea({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provide<DetailsInfoProvide>(
      builder: (context,child,val){
        //从model层变量化获取数据
         var goodsInfo=Provide.value<DetailsInfoProvide>(context).goodsInfo.data.goodInfo;
         if (goodsInfo!=null) {
           return Container(
             color: Colors.white,
             child: Column(
               children: <Widget>[
                 _goodsImages(goodsInfo.image1),
                 _goodsName(goodsInfo.goodsName),
                 _goodsPrice(goodsInfo.presentPrice, goodsInfo.oriPrice)
               ],
             ),
           );
         } else {
           return Text('正在加载中');
         }
      },
    );
  }

// 商品详情商品图片小模块
  Widget _goodsImages(url){
   return Image.network(
     url,
     width: ScreenUtil().setWidth(740),
   );
  }

  // 商品名称小组件
  Widget _goodsName(name){
   return Container(
     width: ScreenUtil().setWidth(740),
     padding: EdgeInsets.only(left: 15.0),
     child: Text(
       name,
       style: TextStyle(
         fontSize: ScreenUtil().setSp(30)
       ),
       ),
   );
  }

  // 商品编号
  Widget _goodsNum(nums){
    return Container(
      width: ScreenUtil().setWidth(730),
      padding: EdgeInsets.only(left:15.0),
      margin: EdgeInsets.only(top: 8.0),
      child: Text(
        "编号：${nums}",
        style: TextStyle(
          color: Colors.black12
        ),
      ),
    );
  }

  // 商品价格
  Widget _goodsPrice(presentPrice,oriPrice){
   return Container(
    width: ScreenUtil().setWidth(730),
    padding: EdgeInsets.only(left:15.0),
    margin: EdgeInsets.only(top: 8.0),
    child: Row(
      children: <Widget>[
        Text(
          '￥${presentPrice}',
          style: TextStyle(
            color: Colors.pinkAccent,
            fontSize: ScreenUtil().setSp(40)
           ),
        ),
      
        Text(
          '市场价:￥${oriPrice}',
          style: TextStyle(
            color: Colors.black26,
            fontSize: ScreenUtil().setSp(26),
            decoration: TextDecoration.lineThrough,
            textBaseline: TextBaseline.alphabetic
           ),
           maxLines: 2,
        ),
      ],
    )
   );
  }
}