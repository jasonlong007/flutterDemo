import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';
import '../../provide/details_info.dart';
import 'package:flutter_html/flutter_html.dart';

class DetailsWeb extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // 获取商品详情
    var goodsDetails=Provide.value<DetailsInfoProvide>(context).goodsInfo.data.goodInfo.goodsDetail;
        
    return Provide<DetailsInfoProvide>(
      builder: (context,child,val){
         var isLeft=Provide.value<DetailsInfoProvide>(context).isLeft;
         if (isLeft) {
           return  Container(
              child: Html(
                data: goodsDetails,
                onLinkTap: (url){
                  
                },
              ),
              
            );
         } else {
           return Container(
             width: ScreenUtil().setWidth(750),
             padding: EdgeInsets.only(top: 50.0),
             alignment: Alignment.center,
             child: Text('暂无数据'),
           );
         }
      },
    );
    
   
  }
}