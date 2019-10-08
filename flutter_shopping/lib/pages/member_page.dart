import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provide/provide.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class MemberPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('会员中心'),
      ),
      body: ListView(
        children: <Widget>[
          _topHeader(),
          _orderTitle(),
          _orderType(),
          _actionList()
        ],
      ),
    );
  }

  // 内部方法：头部header
  Widget _topHeader(){
    return Container(
      width: ScreenUtil().setWidth(750),
      padding: EdgeInsets.all( 20),
      color: Colors.pinkAccent,
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 30),
            child: ClipOval(//圆形裁剪
               
              child: Image.asset(
                'images/jason.jpg',
                width: 100,
                height: 100,
                fit: BoxFit.cover,
                ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Text(
              'Jason Long',
               style: TextStyle(
                 fontSize: ScreenUtil().setSp(36),
                 color: Colors.white
               ),
              
              ),

          )
        ],
      ),
    );
  }


  // 内部方法：我的订单
  Widget _orderTitle(){
    return Container(
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            width: 1,
            color: Colors.black12
          )
        )
      ),
      child: ListTile(
        leading: Icon(Icons.list),
        title: Text('我的订单'),
        trailing: Icon(Icons.arrow_right),
        onTap: (){
          print('点击了我的订单标题');
        },
      ),
    );
  }

  // 内部方法:订单类别
  Widget _orderType(){
    return Container(
      margin: EdgeInsets.only(top: 10), 
      width: ScreenUtil().setWidth(750),
      height: ScreenUtil().setHeight(150),
      padding: EdgeInsets.only(top: 20),
      color: Colors.white,
      child: Row(
        children: <Widget>[
          // 待付款
          Container(
            width: ScreenUtil().setWidth(187),
            child: Column(
              children: <Widget>[
                 Icon(
                   Icons.party_mode
                 ),
                 Text('待付款'),
              ],
              
            ),
            
          ),
          // 待发货
           Container(
            width: ScreenUtil().setWidth(187),
            child: Column(
              children: <Widget>[
                 Icon(
                   Icons.query_builder
                 ),
                 Text('待发货')
              ],
            ),
          ),
          // 待收货
           Container(
            width: ScreenUtil().setWidth(187),
            child: Column(
              children: <Widget>[
                 Icon(
                   Icons.departure_board
                 ),
                 Text('待收货')
              ],
            ),
          ),
          // 待评价
           Container(
            width: ScreenUtil().setWidth(187),
            child: Column(
              children: <Widget>[
                 Icon(
                   Icons.content_paste
                 ),
                 Text('待评价')
              ],
            ),
          )
        ],
      ),
    );
  }


  // 内部方法：通用listTitle
  Widget _orderListTitle(String title){
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
             width: 1,color: Colors.black12
          )
        )
      ),
      child: ListTile(
        leading: Icon(Icons.blur_circular),
        title: Text(title),
        trailing: Icon(Icons.arrow_right),
      ),
    );
  }
   Widget _actionList(){
     return Container(
       margin: EdgeInsets.only(top: 10),
       child: Column(
         children: <Widget>[
           _orderListTitle('领取优惠券'),
           _orderListTitle('已领取优惠券'),
           _orderListTitle('地址管理'),
           _orderListTitle('客服电话'),
           _orderListTitle('地址管理'),
         ],
       ),
     );
   }
}