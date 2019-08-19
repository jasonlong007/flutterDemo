import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class HomePage1 extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage1> {
  TextEditingController typeController=TextEditingController();
  String showText="观影来到英雄联盟";
  @override
  Widget build(BuildContext context) {
    return Container(
      child:Scaffold(
        appBar: AppBar(title: Text('美好人间'),),
        body: Container(
          child: Column(
            children: <Widget>[
              TextField(
                controller: typeController,
                decoration: InputDecoration(//输入框
                  contentPadding: EdgeInsets.all(10.0),
                  labelText: '美女类型',
                  helperText: '请输入你喜欢的类型'
                ),
                autofocus: false,
              ),
              RaisedButton(
                onPressed: (){
                  setState(() {
                   _choiceAction(); 
                  });
                },
                child: Text('选择完毕'),
              ),
              Text(
                showText,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              )
            ],
          ),
        ),
      ),
      
    );
  }

  // 创建一个点击按钮
  void _choiceAction(){
    print('test');
    // 判断等于空的时候
    if (typeController.text.toString()=='') {
      showDialog(
        context: context,//上下文
        builder: (context)=>
          AlertDialog(title: Text("不能为空"))
        
      );
    } else {
      getHttp(typeController.text.toString()).then((val){
        setState(() {
         showText= val['data']['name'].toString();
        });
      });
    }
  }

  // 异步请求
  Future  getHttp(String TypeText) async{
    try {
      Response response;
      var data={'name':TypeText};
      response=await Dio().post(
        'https://www.easy-mock.com/mock/5d315e4487d518560879e4ec/homePageContent/dabaojian_post',
        queryParameters: data
        );
        return response.data;
    } catch (e) {
      return print(e);
    }
  }
}