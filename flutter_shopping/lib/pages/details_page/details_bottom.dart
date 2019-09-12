import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shopping/routers/application.dart';
import 'package:provide/provide.dart';
import '../../provide/cart.dart';
import '../../provide/details_info.dart';
import 'package:flutter/cupertino.dart';
import '../../provide/currentIndex.dart';

class DetailsBottom extends StatelessWidget {
  const DetailsBottom({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 从商品详情状态中获取数据参数
    var goodsInfo=Provide.value<DetailsInfoProvide>(context).goodsInfo.data.goodInfo;
    var goodsId=goodsInfo.goodsId;
    var goodsName=goodsInfo.goodsName;
    var count=1;
    
    var price=goodsInfo.presentPrice;
    var images=goodsInfo.image1;


    return Container(
      width: ScreenUtil().setWidth(750),
      color: Colors.white,
      height: ScreenUtil().setHeight(80.0),
      child: Row(
        children: <Widget>[
          Stack(
             children: <Widget>[
                  InkWell(
                  onTap: (){
                    // Application.router.navigateTo(context, '/cartPage');
                    Provide.value<CurrentIndexProvide>(context).changeIndex(2);
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: ScreenUtil().setWidth(110),
                    alignment: Alignment.center,
                    child: Icon(Icons.shopping_cart,size: 35,color: Colors.red,),
                  ),
                ),
                // Text('数量${allGoodsCount}'),
                Provide<CartProvide>(
                  builder: (context,child,val){
                    int allGoodsCount=Provide.value<CartProvide>(context).allGoodsCount;
                    return  Positioned(
                      top: 0,
                      right: 10,
                      child: Container(
                        padding: EdgeInsets.fromLTRB(6, 3, 6, 3),
                        decoration: BoxDecoration(
                          color: Colors.pink,
                          border: Border.all(width: 2,color: Colors.white),
                          borderRadius: BorderRadius.circular(12.0)
                        ),
                        child: Text(
                          '${allGoodsCount}',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: ScreenUtil().setSp(12)
                          ),
                          ),
                      ),
                    );
                  },
                )
             ],
          ),
         
          InkWell(
            onTap: ()async{
             await Provide.value<CartProvide>(context).save(goodsId, goodsName, count, price, images);
            showDialog(
                context: context,//上下文
                builder: (context)=>
                  AlertDialog(
                     title: Text("信息提示"),
                     content: Text('你的宝贝${goodsName}添加到购物车了'),
                     actions: <Widget>[
                       FlatButton(
                         onPressed: (){
                            Application.router.navigateTo(context, '/cartPage');
                           
                         },
                         child: Text('去购物车'),
                       ),
                        FlatButton(
                         onPressed: (){
                           Navigator.of(context).pop();
                         },
                         child: Text('取消'),
                       )
                     ],
                    )
              );
            },
            child: Container(
              width: ScreenUtil().setWidth(320),
              alignment: Alignment.center,
              height: ScreenUtil().setHeight(80),
              color: Colors.green,
              child: Text(
                '加入购物车',
                 style: TextStyle(
                   color: Colors.white,
                   fontSize: ScreenUtil().setSp(28)
                 ),
              ),
            ),
          ),
          InkWell(
            onTap: ()async{
               await Provide.value<CartProvide>(context).remove();
            },
            child: Container(
              width: ScreenUtil().setWidth(320),
              alignment: Alignment.center,
              height: ScreenUtil().setHeight(80),
              color: Colors.red,
              child: Text(
                '立即购买',
                 style: TextStyle(
                   color: Colors.white,
                   fontSize: ScreenUtil().setSp(28)
                 ),
              ),
            ),
          )
        ],
      ),
    );
  }
}