import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import '../provide/details_info.dart';
import '../pages/details_page/details_top_area.dart';
import '../pages/details_page/details_explain.dart';
import '../pages/details_page/details_tabbar.dart';
import './details_page/details_web.dart';//商品详情html部分
// import './details_page/detals_web_html.dart';

class DetailsPage extends StatelessWidget {
  final String goodsId;

   DetailsPage(this.goodsId);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(//返回按钮
          icon: Icon(Icons.arrow_back),
          onPressed: (){
            print('点击返回触发的${context}');
            Navigator.pop(context);//返回上一层
          },
        ),
        title: Text('商品详情页'),
      ),
      body: FutureBuilder(
        //使用futureBuilder是一个将异步操作和异步UI更新结合在一起的类，通过它完美可以将网络请求和数据读取等结果更新在页面上
        future:  _getBackInfo(context),
        builder: (context,snapshot){
          if (snapshot.hasData) {//如果有值的话
            return Container(
              child: ListView(
                children: <Widget>[
                  DatailsTopArea(),
                  DetailsExplain(),
                  DetailsTabbar(),
                  DetailsWeb()
                ],
              ),
            );
          }else{
            return Text('加载中...');
          }
        },

      ),
    );
  }

  Future _getBackInfo(BuildContext context) async{
  //  异步请求数据
   await Provide.value<DetailsInfoProvide>(context).getGoodsInfo(goodsId);
     return '完成加载';
  }
}