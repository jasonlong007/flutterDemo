import 'package:flutter/material.dart';
import 'dart:async';
// import 'package:sky_engine/_http/http.dart' as http;
import 'package:http/http.dart' as http;
import 'dart:convert';//解码JSON String ->Object


// 创建一个有状态的控件
class MyGetHttpData extends StatefulWidget {
  @override
  _MyGetHttpDataState createState() => _MyGetHttpDataState();
}

// 为我们的状态小控件创建状态
class _MyGetHttpDataState extends State<MyGetHttpData> {
  // 定一个接受接口的变量
  final String url="https://swapi.co/api/people";
  // 定一个存储数据的变量
  List data;

  // 创建一个获取JSON数据的函数 async异步请求接口
  Future<String> getJSONData() async{
   var resonse= await http.get(
    //  用encodeFull来解决URL传递时的中文问题
    Uri.encodeFull(url),
    // 只接受JSONd 响应
    headers:{'Accept':"application/json"});

    // 打印一下结果
    print(resonse.body);

    // 修改状态
    setState(() {
      // 获得接口数据
      var dataConvertedToJSON=json.decode(resonse.body);
      // 提取所需要的部分并将其分配给data的全局变量
      data=dataConvertedToJSON['results'];
    });
    return "Successfull";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('JSON请求'),
      ),
      // 创建Listview并在可用时加载数据
      body: ListView.builder(
        itemCount: data==null ? 0 : data.length,
        itemBuilder: (BuildContext context, int index) {
        return Center(
          child: Center(
            child: Column(
              // 沿水平轴拉伸卡片
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Card(
                  child: Container(
                    height: 40.0,
                    
                    child: Text(
                      // 读取字段在文本框进行设置
                      data[index]['name'],
                      // 设置颜色
                      style: TextStyle(
                        fontSize: 20.0,color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Card(
                  child: Container(
                    
                    child: Text(
                      // 读取字段在文本框进行设置
                      data[index]['eye_color'],
                      // 设置颜色
                      style: TextStyle(
                        fontSize: 10.0,color: Colors.lightBlueAccent
                      ),
                    ),
                  
                  ),
                ),
              ],
            ),
          ),
        );
       },
      ),
    );
  }
  @override
  void initState() {
    super.initState();
    this.getJSONData();
  }
}