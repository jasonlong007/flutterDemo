import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import '../config/httpHeaders.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // 请求数据变量
  String showText='还没有请求数据';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(title: Text('请求远端的数据')),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              RaisedButton(
                onPressed: (){
                  setState(() {
                   _jike(); 
                  });
                },
                child: Text('请求数据'),
              ),
              Text(
                showText
              )
            ],
          ),
        ),
      ),
    );
  }

 void _jike(){
   print('开始向极客时间请求数据');
   getHttp().then((val){
     setState(() {
       showText=val['data'].toString();
     });
   });
 }

  // 建立一个异步请求
  Future getHttp() async{
    try {
      Response response;
      Dio dio=new Dio();
      dio.options.headers=httpHeaders;
      response=await dio.get('https://time.geekbang.org/serv/v1/column/newAll');
      print(response);
      return response.data;

    } catch (e) {
      return print(e);
    }
  }
}