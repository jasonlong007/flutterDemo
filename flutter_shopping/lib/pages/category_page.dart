import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../service/service_medthod.dart';
import 'dart:convert';
import '../model/category.dart';
import '../provide/child_category.dart';
import 'package:provide/provide.dart';
import '../model/category.dart';
import '../model/categoryGoodsList.dart';
import '../provide/category_goods_list.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:fluttertoast/fluttertoast.dart';//引入轻提示



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
            LeftCategoryNav(),
            Column(
             children: <Widget>[
                RightCategoryNav(),
                CategoryGoodsList()
             ],
            )
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
  List<CategoryModelData> categoryList=[];
  // 创建一个变量用来接收
  List<CategoryGoodsListData> categoryGoodList=[];
    var listIndex = 0; //索引

   @override
void initState() { 
  _getCategory();
  _getGoodsList();
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
        itemCount: categoryList.length,
        itemBuilder: (context,index){
        return _lefInWel(index);
        },
      ),
    );
  }


  //编写大类子项
  Widget _lefInWel(int index){
    // 创建一个bool控制是否高亮
    bool isClick=false;
    isClick=(index==listIndex) ? true:false;
     return InkWell(
       onTap: (){
          setState(() {
           listIndex=index;
         });
        //  将大类里面的小分类赋值给childList
           var childlist=categoryList[index].bxMallSubDto;
           var categoryId=categoryList[index].mallCategoryId;
          //  print('childList*************************${childlist}');
          //  点击改变赋值
          Provide.value<ChildCategory>(context).getChildCategory(childlist,categoryId);

          _getGoodsList(categoryId:categoryId);
       },
       child: Container(
         height: ScreenUtil().setHeight(100),
         padding: EdgeInsets.only(left:10,top: 20),
         decoration: BoxDecoration(
           color:isClick? Color.fromRGBO(236, 236, 236, 1.0): Colors.white,
           border: Border(
             bottom: BorderSide(width: 1.0,color: Colors.black12)
           )
         ),
          child: Text(
            categoryList[index].mallCategoryName,
             style: TextStyle(fontSize:ScreenUtil().setSp(28),
             color: isClick?Colors.redAccent:Colors.black
            )),
       ),
     );
  } 

  // 创建一个内部方法请求解决接口
void _getCategory() async {
      await request('getCategory').then((val) {
      var data = json.decode(val.toString());
      CategoryModel category = CategoryModel.fromJson(data);
      setState(() {
        categoryList = category.data;
      });
       Provide.value<ChildCategory>(context).getChildCategory( categoryList[0].bxMallSubDto,categoryList[0].mallCategoryId);
        // categoryList[0].bxMallSubDto.forEach((item) => print(item.mallSubName));
    });
  }
  // 内部类获取商品列表
  void _getGoodsList({String categoryId}) async {
    var data={
       'categoryId':categoryId==null?'4':categoryId,
       'categorySubId':'',
       'page':1
    };
    await request('getMallGoods',formData: data).then((val){
      var data=json.decode(val.toString());
      CategoryGoodsListModel goodsList=CategoryGoodsListModel.fromJson(data);
      Provide.value<CategoryGoodsListProvide>(context).getGoodsList(goodsList.data);
    });
  }

  

  
}



// 右侧小类d导航
class RightCategoryNav extends StatefulWidget {
  RightCategoryNav({Key key}) : super(key: key);

  _RightCategoryNavState createState() => _RightCategoryNavState();
}

class _RightCategoryNavState extends State<RightCategoryNav> {
  // List list=['名酒','宝丰','北京二锅头','茅台','五粮液','舍得'];

  @override
  Widget build(BuildContext context) {
    // 使用状态管理
    return Provide<ChildCategory>(
      builder: (context,child,childCategory){
         return Container(
            height: ScreenUtil().setHeight(80),
            width: ScreenUtil().setWidth(570),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(bottom: BorderSide(width: 1,color: Colors.black12))
            ),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,//横向纵轴
              itemCount: childCategory.childCategoryList.length,
              itemBuilder: (context,index){
                return _rightInkWell(index,childCategory.childCategoryList[index]);
              },
            ),
          );
      },
    );
    
     
  }

  // 创建内部小组件
  // 增加一个接收参数int index.这就是修改变量的索引值
  Widget _rightInkWell(int index,BxMallSubDto item){
  //  定义是否高亮变量
  bool isClick=false;
  isClick=(index==Provide.value<ChildCategory>(context).childIndex)?true:false;
   return InkWell(
     onTap: (){
        Provide.value<ChildCategory>(context).changChildIndex(index,item.mallSubId);
        _getGoodsList(item.mallSubId);
     },
     child: Container(
       padding: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
       child: Text(
         item.mallSubName,
         style:TextStyle(
           fontSize:ScreenUtil().setSp(28),
           color: isClick?Colors.pink:Colors.black
           )
       ),
     ),
   );
  }

   // 内部类获取商品列表
  void _getGoodsList(String categorySubId) async {
    var data={
       'categoryId':Provide.value<ChildCategory>(context).categoryId,
       'categorySubId':categorySubId,
       'page':1
    };
    await request('getMallGoods',formData: data).then((val){
      var data=json.decode(val.toString());
      CategoryGoodsListModel goodsList=CategoryGoodsListModel.fromJson(data);
      // 判断商品列表数据
      if (goodsList.data==null) {
        
        Provide.value<CategoryGoodsListProvide>(context).getGoodsList([]);
      } else {
         Provide.value<CategoryGoodsListProvide>(context).getGoodsList(goodsList.data);
      }
     
    });
  }

}


// 商品列表，可以上拉加载
class CategoryGoodsList extends StatefulWidget {
  CategoryGoodsList({Key key}) : super(key: key);

  _CategoryGoodsListState createState() => _CategoryGoodsListState();
}

class _CategoryGoodsListState extends State<CategoryGoodsList> {
  // 创建一个变量用来接收
  // List<CategoryGoodsListData> categoryGoodList=[];

   GlobalKey<RefreshFooterState> _footerkey=new GlobalKey<RefreshFooterState>();
  //  声明一个控制器
   var scrollController=new ScrollController();
  @override
  void initState() {
    // _getGoodsList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Provide<CategoryGoodsListProvide>(
        builder: (context,child,data){
          // 解决切换类别返回顶部
          try {
           if(Provide.value<ChildCategory>(context).page==1){
            //  初始的时候，列表位置放置最上面
            scrollController.jumpTo(0.0);
           }
          } catch (e) {
            print('进入页面第一次初始化：${e}');
          }

          // 判断没有数据时候
          if (data.goodsList.length>0) {
                return Expanded(
                    child: Container(
                        width: ScreenUtil().setHeight(520),
                        // height: ScreenUtil().setHeight(1000),
                        child:EasyRefresh(
                          refreshFooter: ClassicsFooter(
                            key: _footerkey,
                            bgColor: Colors.white,
                            textColor: Colors.pink,
                            moreInfoColor: Colors.pink,
                            showMore: true,
                            noMoreText: Provide.value<ChildCategory>(context).noMoreText,
                            moreInfo: '加载中',
                            loadReadyText: '上拉加载....',
                          ),
                          child: ListView.builder(
                            controller: scrollController,//加上控制器
                            itemCount: data.goodsList.length,
                            itemBuilder: (context,index){
                              return _categoryGoodListWidget(data.goodsList,index);
                            },
                          ), 
                          loadMore: () async{//上拉加载回调请求函数
                              print('没有更多了.................');
                             
                               // 内部类获取商品列表
                             _getMoreGoodsList();
                              
                          },
                        )
                        
                      ),
              );
          } else {
            return Expanded(
              child: Container(
                child: Text('暂无数据'),
              ),
            );
          }
         
         
        }, 
    

        
    );
  }


// 调用加载更多接口
    void _getMoreGoodsList() async {
      // 调用加载的，先把page++
      Provide.value<ChildCategory>(context).addPage();
    var data={
      'categoryId':Provide.value<ChildCategory>(context).categoryId,
      'categorySubId':Provide.value<ChildCategory>(context).subId,
      'page':Provide.value<ChildCategory>(context).page
    };
    await request('getMallGoods',formData: data).then((val){
      var data=json.decode(val.toString());
      CategoryGoodsListModel goodsList=CategoryGoodsListModel.fromJson(data);
      // 判断商品列表数据
      if (goodsList.data==null) {
         Fluttertoast.showToast(
          msg: "已经到底了",
          toastLength: Toast.LENGTH_SHORT,//提示样式长度
          gravity: ToastGravity.CENTER,//提示出现的位置
          timeInSecForIos: 1,//显示时间长度
          backgroundColor: Colors.pink,//背景颜色
          textColor: Colors.white,//文字颜色
          fontSize: 16.0//文字大小
        );
        Provide.value<ChildCategory>(context).changNoMore('没有更多了，亲');
      } else {
        Provide.value<CategoryGoodsListProvide>(context).getMoreGoodsList(goodsList.data);
      }
    
    });
  }

  // 列表拆分成三个内部方法分别是商品图片，商品名称和商品价格。
  // 这样拆分可以减少耦合度和维护难度
  // 商品图片内部方法
  Widget _goodsImage(List newList,index){
    return Container(
      width: ScreenUtil().setWidth(180),
      child: Image.network(newList[index].image),
    );
  }
//  商品名称内部小组件
  Widget _goodsName(List newList,index){
   return Container(
    padding: EdgeInsets.all(5.0),
    width: ScreenUtil().setWidth(370),
    child: Text(
      newList[index].goodsName,
      maxLines: 2,//设置最大行数
      overflow: TextOverflow.ellipsis,//文字过长使用...
      style: TextStyle(
        fontSize: ScreenUtil().setSp(28)
      ),
    ),
   );
  }
  // 商品价格方法编写
  Widget _goodsPrice(List newList,index){
    return Container(
      margin: EdgeInsets.only(top: 20.0),
      width: ScreenUtil().setWidth(370),
      child: Row(
        children: <Widget>[
          Text(
           '价格：￥${newList[index].presentPrice}',
           style: TextStyle(
             color: Colors.pink,
             fontSize: ScreenUtil().setSp(30)
           ),
          ),
          Text(
            '￥${newList[index].oriPrice}',
            style: TextStyle(
              color: Colors.black26,
              decoration: TextDecoration.lineThrough//删除线
            ),
          )
        ],
      ),
    );
  }

  // 创建一个方法组合成子项
  Widget _categoryGoodListWidget(List newList,int index){
  return InkWell(
    onTap: (){},
  child: Container(
     padding: EdgeInsets.only(top: 5.0,bottom: 5.0),
     decoration: BoxDecoration(
       color: Colors.white,
       border: Border(
         bottom: BorderSide(width: 1.0,color: Colors.black12)
       )
     ),

     child: Row(
       children: <Widget>[
         _goodsImage(newList,index),
         Column(
           children: <Widget>[
             _goodsName(newList,index),
             _goodsPrice(newList,index)
           ],
         )
       ],
    ),

  ),
   
  );
  }

  
}