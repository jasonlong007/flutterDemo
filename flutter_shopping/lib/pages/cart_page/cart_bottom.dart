import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';
import '../../provide/cart.dart';

class CartBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:EdgeInsets.all(5.0),
      color: Colors.white,
      child:Provide<CartProvide>(
        builder: (context,child,val){
          return  Row(
            children: <Widget>[
                _selectAllBtn(context),
                _allPriceArea(context),
                goButton(context)
            ],
          );
        },
      ), 
      
     
    );
  }
  // 内部方法：全选按钮
  Widget _selectAllBtn(context){
    bool isAllCheck=Provide.value<CartProvide>(context).isAllCheck;
    return Container(
      child: Row(
        children: <Widget>[
          Checkbox(
            value: isAllCheck,
            activeColor: Colors.pink,
            onChanged: (bool val){
              Provide.value<CartProvide>(context).changeAllCheckBtnState(val);
            },
          ),
          Text('全选')
        ],
      ),
    );
  }

  // 内部方法：合计
  Widget _allPriceArea(context){
    // 从provide获取总价格
        double allPrice=Provide.value<CartProvide>(context).allPrice;

    return Container(
      width: ScreenUtil().setWidth(430),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                alignment: Alignment.centerRight,
                width: ScreenUtil().setWidth(280),
                child: Text(
                  '合计:',
                  style:TextStyle(
                    fontSize: ScreenUtil().setSp(36)
                  )
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                width: ScreenUtil().setWidth(150),
                child: Text(
                  '￥${allPrice}',
                  style:TextStyle(
                    fontSize: ScreenUtil().setSp(36),
                    color: Colors.red
                  )
                ),
              )
            ],
          ),
          Container(
            width: ScreenUtil().setWidth(430),
            alignment: Alignment.centerRight,
            child: Text(
              '满10元免配送费，预购免配送',
              style:TextStyle(
                color:Colors.black38,
               fontSize: ScreenUtil().setSp(22),
              )
            ),
          )
        ],
      ),
    );
  }


  // 内部方法：结算按钮
  Widget goButton(context){
    int allGoodsCount=Provide.value<CartProvide>(context).allGoodsCount;
    return Container(
      width: ScreenUtil().setWidth(160),
      padding: EdgeInsets.only(left: 10),
      child: InkWell(
        onTap: (){},
        child: Container(
          padding: EdgeInsets.all(10.0),
          alignment: Alignment.center,//文件居中
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(3.0)
          ),
          child: Text(
            '结算(${allGoodsCount})',

            style:TextStyle(
              color:Colors.white
            )
            ),
        ),
      ),
    );
  }
}