import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import '../service/service_medthod.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'dart:convert';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

// 引入路由静态化
import '../routers/application.dart';

class HomePage extends StatefulWidget {
  _HomePageState createState() => _HomePageState();

}
// 保持页面效果 with 混入 AutomaticKeepAliveClientMixin

class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin{
   
   int page=1;
   List<Map> hotGoodsList=[];

   GlobalKey<RefreshFooterState> _footerkey=new GlobalKey<RefreshFooterState>();


  // 第二加上bool get wantKeepAlive=>true;
  @override
  bool get wantKeepAlive=>true;
  @override
  void initState() {
    super.initState();
    // _getHotGoods();
    // print("111111111111");
  }

  @override
  Widget build(BuildContext context) {
   var formData = {'lon':'115.02932','lat':'35.76189'};
    return Scaffold(
      appBar: AppBar(title: Text('Topiom+'),),
      body:FutureBuilder(
        future:request('homePageContent',formData:formData),
        builder: (context,snapshot){
          if(snapshot.hasData){
             var data=json.decode(snapshot.data.toString());
             List<Map> swiperDataList = (data['data']['slides'] as List).cast(); // 顶部轮播组件数
             List<Map> navgatorList = (data['data']['category'] as List).cast();//导航数据
             String adPicture=(data['data']['advertesPicture']['PICTURE_ADDRESS']);//广告图片
             String leaderImage=data['data']['shopInfo']['leaderImage'];//店长图片
            String leaderPhone=data['data']['shopInfo']['leaderPhone'];//店长电话
             List<Map> recommendList = (data['data']['recommend'] as List).cast();//商品列表
            //  floorGoodsList
              String floor1Title=data['data']['floor1Pic']['PICTURE_ADDRESS'];//楼层1的标题图
              String floor2Title=data['data']['floor2Pic']['PICTURE_ADDRESS'];//楼层2的标题图
              String floor3Title=data['data']['floor3Pic']['PICTURE_ADDRESS'];//楼层3的标题图
              List<Map> floor1 = (data['data']['floor1'] as List).cast();//楼层1商品和图片
              List<Map> floor2 = (data['data']['floor2'] as List).cast();//楼层2商品和图片
              List<Map> floor3 = (data['data']['floor3'] as List).cast();//楼层3商品和图片
             
            //  运用上拉下来加载必须用到ListView

            //  return SingleChildScrollView(
               return EasyRefresh(
                //  自定义样式
                refreshFooter: ClassicsFooter(
                  key: _footerkey,
                  bgColor: Colors.white,
                  textColor: Colors.pink,
                  moreInfoColor: Colors.red,
                  showMore: true,
                  noMoreText: '',
                  moreInfo: '加载中',
                  loadedText: '上拉加载......',
                ),
                 loadMore: ()async{
                    print('开始加载更多.....');
                     var formPage={'page':page};
                   await request('homePageBelowConten',formData: formPage).then((val){
                      var data=json.decode(val.toString());//序列化JSON
                      List<Map> newGoodsList=(data['data'] as List).cast();
                      setState(() {
                        hotGoodsList.addAll(newGoodsList);
                        page++;
                      });
                    });
                 },
                 child:ListView(
                    children: <Widget>[
                        SwiperDiy(swiperDataList:swiperDataList),   //页面顶部轮播组件
                        TopNavigator(topNavigatorList:navgatorList),
                        AdBanner(adPicture:adPicture),
                        LeaderPhone(leaderImage:leaderImage,leaderPhone:leaderPhone),
                        Recommend(recommendList:recommendList),
                        FloorTitle(picture_address:floor1Title),
                        FloorContent(floorGoodsList:floor1),
                        FloorTitle(picture_address:floor2Title),
                        FloorContent(floorGoodsList:floor2),
                        FloorTitle(picture_address:floor3Title),
                        FloorContent(floorGoodsList:floor3),
                        _hotGoods(),
                    ],
                 ),
               );
              
              
          }else{
            return Center(
              child: Text('加载中'),
            );
          }
        },
      )
    );

  }


//  火爆专区标题，变量式
Widget hotTitle=Container(
  margin: EdgeInsets.only(top: 10.0),
  padding: EdgeInsets.all(5.0),
  alignment: Alignment.center,
  color: Colors.transparent,
  child: Text('火爆专区',style: TextStyle(color: Colors.red,fontSize: ScreenUtil().setSp(50.0),fontWeight: FontWeight.w600),),
);

// 制作Warp流式布局的使用
Widget _wrapList(){
  // 判断长度
  if (hotGoodsList.length!=0) {
    List<Widget> listWidget=hotGoodsList.map((val){
     return InkWell(
       onTap: (){
       Application.router.navigateTo(context, "/detail?id=${val['goodsId']}");
       },
       child: Container(
         width: ScreenUtil().setWidth(372),
         color: Colors.white,
         padding: EdgeInsets.all(5.0),
         margin: EdgeInsets.only(bottom: 3.0),
         child: Column(
           children: <Widget>[
             Image.network(
               val['image'],
               width: ScreenUtil().setWidth(370),
               ),
             Text(
               val['name'],
               maxLines: 1,
               overflow: TextOverflow.ellipsis,
               style: TextStyle(
                 color: Colors.pink,
                 fontSize: ScreenUtil().setSp(26)
               ),
             ),
             Row(
               children: <Widget>[
                 Text('￥${val['mallPrice']}'),
                 Text(
                   '￥${val['price']}',
                   style: TextStyle(
                     color: Colors.black26,
                     decoration: TextDecoration.lineThrough//删除线
                   ),
                   
                   )
               ],
             )
           ],
         ),
       ),
     );
    }).toList();

    return Wrap(
      spacing: 2,
      children: listWidget,
    );
  } else {//没有数据的时候
     return Text('');
  }
}

// 有了标题和商品列表组件，把两个组件组合起来
// 火爆专区组合
Widget _hotGoods(){
  return Container(
    child: Column(
      children: <Widget>[
        hotTitle,
        _wrapList()
      ],
    ),
  );
}

}
// 首页轮播组件编写
class SwiperDiy extends StatelessWidget {
  final List swiperDataList;
  SwiperDiy({Key key,this.swiperDataList}):super(key:key);

  @override
  Widget build(BuildContext context) {
   
    print("设备像素密度：${ScreenUtil.pixelRatio}");
    print("设备像素高：${ScreenUtil.screenHeight}");
    print("设备宽：${ScreenUtil.screenWidth}");

    return Container(
       width: ScreenUtil.getInstance().setWidth(750),
       height: ScreenUtil.getInstance().setHeight(333),
      // width: ScreenUtil().scaleWidth(750.0),
      child: Swiper(
        itemBuilder: (BuildContext context,int index){
          return InkWell(
            onTap: (){
              Application.router.navigateTo(context, '/detail?id=${swiperDataList[index]['goodsId']}');
            },
            child: Image.network("${swiperDataList[index]['image']}",fit:BoxFit.fill),
          );
        },
        itemCount: swiperDataList.length,
        pagination: new SwiperPagination(),
        autoplay: true,
      ),
    );
  }
}

// 导航条
class TopNavigator extends StatelessWidget {

  final List topNavigatorList;
  TopNavigator({Key key,this.topNavigatorList}):super(key:key);

  Widget _gridViewItemUI(BuildContext context,item){
     return InkWell(
        onTap: (){
          Application.router.navigateTo(context, '/test1');
        },
        child:Container(
          color: Colors.white,
         child:Column(
          children: <Widget>[
            Image.network(item['image'],width:ScreenUtil.getInstance().setWidth(95)),
            Text(item['mallCategoryName']),
            
          ],
        ),
        ) 
     );
  }


  @override
  Widget build(BuildContext context) {
     if(this.topNavigatorList.length>10){
      this.topNavigatorList.removeRange(10, this.topNavigatorList.length);
    }

    return Container(
      height: ScreenUtil.getInstance().setWidth(320),
      
      padding: EdgeInsets.all(3.0),
      child: GridView.count(
        //解决导航栏下来和底部下来起冲突
        physics: NeverScrollableScrollPhysics(),
       crossAxisCount: 5,
       padding: EdgeInsets.all(5.0),
       children:topNavigatorList.map((item){
         return _gridViewItemUI(context, item);
       }).toList(),
      ),
    );
  }
}


// 广告栏目
class AdBanner extends StatelessWidget {
  final String adPicture;
  AdBanner({Key key,this.adPicture}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.network(adPicture),
    );
  }
}

// 店长电话模块
class LeaderPhone extends StatelessWidget {
  final String leaderImage;//店长图片
  final String leaderPhone;//店长电话

  LeaderPhone({Key key,this.leaderImage,this.leaderPhone}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap:_lounchURL,
        child: Image.network(leaderImage),
      ),
    );
  }

  // 构建一个内部方法
  void _lounchURL() async{
    String url='tel:'+leaderPhone;
    //  String url='https://www.baidu.com/';
    if (await canLaunch(url)) {
      await launch(url);
    }else{
      throw 'Url不能进行访问，异常';
    }
  }
}

// 商品推荐类
class Recommend extends StatelessWidget {
  final List  recommendList;

  Recommend({Key key, this.recommendList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
       height: ScreenUtil.getInstance().setHeight(400),
       margin: EdgeInsets.only(top: 10.0),
       child: Column(
         children: <Widget>[
           _titleWidget(),
           _recommedList()
         ],
       ),
    );
  }

//推荐商品标题
  Widget _titleWidget(){
     return Container(
       alignment: Alignment.centerLeft,
       padding: EdgeInsets.fromLTRB(10.0, 2.0, 0,5.0),
       decoration: BoxDecoration(
         color:Colors.white,
         border: Border(
           bottom: BorderSide(width:0.5,color:Colors.black12)
         )
       ),
       child:Text(
         '商品推荐',
         style:TextStyle(color:Colors.pink)
         )
     );
  }
  
  //横向列表
  Widget _recommedList(){

      return Container(
        height:  ScreenUtil.getInstance().setHeight(330),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: recommendList.length,
          itemBuilder: (context,index){
            return _item(context,index);
          },
        ),
      );
  }

  // 商品单独项
  Widget _item(context,index){
    return InkWell(
      onTap: (){
          Application.router.navigateTo(context, "/detail?id=${recommendList[index]['goodsId']}");
      },
      child: Container(
        height:  ScreenUtil.getInstance().setHeight(330),
        width:  ScreenUtil.getInstance().setWidth(250),
        padding: EdgeInsets.all(8.0),
        decoration:BoxDecoration(
          color:Colors.white,
          border:Border(
            left: BorderSide(width:0.5,color:Colors.black12)
          )
        ),
        child: Column(
          children: <Widget>[
            Image.network(recommendList[index]['image']),
            Text('￥${recommendList[index]['mallPrice']}'),
            Text(
              '￥${recommendList[index]['price']}',
              style: TextStyle(
                decoration: TextDecoration.lineThrough,
                color:Colors.grey
              ),
            )
          ],
        ),
      ),
    );
  }
}

// 楼层标题
class FloorTitle extends StatelessWidget {
  final String picture_address;
  FloorTitle({Key key,this.picture_address}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Image.network(picture_address),
      
    );
  }
}

// 楼层商品列表
class FloorContent extends StatelessWidget {
  final List floorGoodsList;
  FloorContent({Key key,this.floorGoodsList}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          _firstRow(context),
          _otherGoods(context)
        ],
      ),
    );
  }

  // 创建内部子组件
  Widget _firstRow(context){
    return Row(
      children: <Widget>[
        _goodsItem(context,floorGoodsList[0]),
        Column(
          children: <Widget>[
            _goodsItem(context,floorGoodsList[1]),
            _goodsItem(context,floorGoodsList[2]),
          ],
        )
      ],
    );
  }

//  创建内部子组件：下面两列
  Widget _otherGoods(context){
    return Row(
      children: <Widget>[
        _goodsItem(context,floorGoodsList[3]),
        _goodsItem(context,floorGoodsList[4]),
      ],
    );
  }


  // 创建内部子组件
  Widget _goodsItem(context,Map goods){
    return Container(
      width:ScreenUtil().setWidth(375),
      child: InkWell(
        onTap: (){
           Application.router.navigateTo(context, "/detail?id=${goods['goodsId']}");
        },
        child: Image.network(goods['image']),
      ),
    );
  }
}


