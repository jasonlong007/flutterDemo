import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './pages/index_page.dart';
import 'package:provide/provide.dart';
import './provide/counter.dart';
import './provide/child_category.dart';
import './provide/category_goods_list.dart';
 
void main() {
  // 将provide和counter引入程序顶层
 var counter=Counter();
 var childCategory=ChildCategory();
 var categoryGoodsList=CategoryGoodsListProvide();
 var providers=Providers();
//  将状态放入状态注入
providers
..provide(Provider<Counter>.value(counter))
..provide(Provider<ChildCategory>.value(childCategory))
..provide(Provider<CategoryGoodsListProvide>.value(categoryGoodsList));
  runApp(ProviderNode(child: MyApp(),providers: providers,));
}
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      foregroundDecoration: BoxDecoration(
        image:DecorationImage(
          image: NetworkImage('./assets/images/logoPart.png'),
        )
      ),
      child: MaterialApp(
        routes: {
          '/IndexPage':(context)=>IndexPage()
        },
        title: 'Optimall',
        
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.pink
        ),
        home: IndexPage(),
        //  home: SplashPage(),
      ),
    );

    // void _goMain(){
    // Navigator.of(context).pushReplacementNamed('/IndexPage');
    // }
  }
  
}