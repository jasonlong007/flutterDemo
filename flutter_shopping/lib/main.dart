import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shopping/routers/routes.dart';
import './pages/index_page.dart';
import 'package:provide/provide.dart';
import './provide/counter.dart';
import './provide/child_category.dart';
import './provide/category_goods_list.dart';
import './provide/details_info.dart';
import 'package:fluro/fluro.dart';

// 路由配置文件
import './routers/router_handler.dart';
// 路由静态化
import './routers/application.dart';
 
void main() {
  // 将provide和counter引入程序顶层
 var counter=Counter();
 var childCategory=ChildCategory();
 var categoryGoodsList=CategoryGoodsListProvide();
  var detailsInfoProvide=DetailsInfoProvide();
 var providers=Providers();


 
//  将状态放入状态注入
providers
..provide(Provider<Counter>.value(counter))
..provide(Provider<ChildCategory>.value(childCategory))
..provide(Provider<CategoryGoodsListProvide>.value(categoryGoodsList))
..provide(Provider<DetailsInfoProvide>.value(detailsInfoProvide));
  runApp(ProviderNode(child: MyApp(),providers: providers,));
}
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //  路由注入路由
    final router=Router();
    Routes.configureRoutes(router);
    // 静态化
    Application.router=router;

    return Container(
      child: MaterialApp(
        title: 'Optimall',
        onGenerateRoute:Application.router.generator,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.pink
        ),
        home: IndexPage(),
        //  home: SplashPage(),
      ),
    );

  }
  
}