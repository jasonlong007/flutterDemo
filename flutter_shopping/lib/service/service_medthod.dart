import 'package:dio/dio.dart';
import 'dart:async';
import 'dart:io';
import '../pages/config/servcie_url.dart';


// 获取主页首页主题neir


// Future getHomePageContent() async{
//   try {
//      print('开始获取首页数据**********');
//     Response response;
//     Dio dio=new Dio();
//     dio.options.contentType=ContentType.parse('application/json');
//     var formData = {'lon':'115.02932','lat':'35.76189'};
//     response=await dio.post(servicePath['homePageContext'],data: formData);
//     if (response.statusCode==200) {
//       return response.data;
//     } else {
//       throw Exception('后端接口异常');
//     }
//   } catch (e) {
//     return print('异常${e}');
//   }

 

// }

Future request(url,{formData}) async{

  try{
    print('开始获取数据...............');
    Response response;
    Dio dio = new Dio();
    dio.options.contentType=ContentType.parse("application/x-www-form-urlencoded");
    if (formData==null) {
       response = await dio.post(servicePath[url]);
    } else {
       response = await dio.post(servicePath[url],data:formData);
    }
   
    if(response.statusCode==200){
      return response.data;
    }else{
      throw Exception('后端接口出现异常，请检测代码和服务器情况.........');
    }
  }catch(e){
    return print('ERROR:======>${e}');
  }

}

Future getHomePageContent() async{

  try{
    print('开始获取首页数据...............');
    Response response;
    Dio dio = new Dio();
    dio.options.contentType=ContentType.parse("application/x-www-form-urlencoded");
    var formData = {'lon':'115.02932','lat':'35.76189'};
    response = await dio.post(servicePath['homePageContent'],data:formData);
    if(response.statusCode==200){
      return response.data;
    }else{
      throw Exception('后端接口出现异常，请检测代码和服务器情况.........');
    }
  }catch(e){
    return print('ERROR:======>${e}');
  }

}

// 获得火爆专区的方法
Future getHomePageBelContent() async{

  try{
    print('开始获取火爆专区数据...............');
    Response response;
    Dio dio = new Dio();
    dio.options.contentType=ContentType.parse("application/x-www-form-urlencoded");
    int page=1;
    response = await dio.post(servicePath['homePageBelowConten'],data:page);
    if(response.statusCode==200){
      return response.data;
    }else{
      throw Exception('后端接口出现异常，请检测代码和服务器情况.........');
    }
  }catch(e){
    return print('ERROR:======>${e}');
  }

}

Future getWeatherInfo() async {
    try {
      print('开始获取首页数据**********');
      Response response;
      Dio dio=new Dio();
      // dio.options.contentType=ContentType.parse('application/json');
      dio.options.headers={"platform":"h5"};
    //  Options options = Options(headers: {HttpHeaders.acceptHeader:"accept: application/json"});

      var formData = {'lon':'115.02932','lat':'35.76189'};
      response=await dio.post(servicePath['homePageContext'],data: formData);
      if (response.statusCode==200) {
        return response.data;
      } else {
        throw Exception('后端接口异常');
      }
    } catch (e) {
      return print('异常${e}');
    }

  }

Future productList() async {
    try {
      print('开始获取test**********');
      Response response;
      Dio dio=new Dio();
      dio.options.contentType=ContentType.parse('application/json');
      FormData formData = new FormData.from(
        {

          "q":"拖鞋",
          "callback":"cb"
        }
      );
      response=await dio.get(servicePath['productList']);
      if (response.statusCode==200) {
        return response.data;
      } else {
        throw Exception('后端接口异常');
      }
    } catch (e) {
      return print('异常${e}');
    }

  }