import 'package:flutter/material.dart';
import '../model/category.dart';

// 创建一个sate状态
// with混入ChangeNotifier:可以不用管理听众，通过notifyListeners（）可以通知听众刷新
class ChildCategory with ChangeNotifier  {
  // 申明一个类
  List<BxMallSubDto> childCategoryList=[];
  // 子类高亮索引
  int childIndex=0;
//  增加一个大类的ID，然后在更改大类的时候改变ID
String categoryId='4';//大类ID

// 把子类IDProvide化
String subId='';//小类ID

// 列表页数，当改变大类或者小类时进行改变
int page=1;
// 显示更多的标识
String noMoreText='';

  // 大类切换逻辑创建一个变化方法
  getChildCategory(List<BxMallSubDto> list,String id){
    page=1;//只有切换的大类或者小类的时候，都重置为1
    noMoreText='';
    childIndex=0;
    categoryId=id;//传入ID
    //  添加子类“全部”按钮
    BxMallSubDto all=BxMallSubDto();
    all.mallSubId='00';
    all.mallCategoryId='00';
    all.mallSubName='全部';
    all.comments='null';
    childCategoryList=[all];

    childCategoryList.addAll(list);
    // 监听数据
    notifyListeners();
  }

  // 改变 子类索引
  changChildIndex(index,String id){
     page=1;//只有切换的大类或者小类的时候，都重置为1
    noMoreText='';
   childIndex=index;
   subId=id;
   notifyListeners();
  }

  // 增加Page的方法
  addPage(){
    page++;
  }

  // 改变noMoreText数据
  changNoMore(String text){
   noMoreText=text;
   notifyListeners();
  }
}