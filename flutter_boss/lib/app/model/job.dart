import 'dart:convert';
import 'package:meta/meta.dart';

// 构建job类
class Job {
  final String name;
  final String cname;
  final String size;
  final String salary;
  final String username;
  final String title;

  // 构造方法 required必须要填写的
  Job({
    @required this.name,
    @required this.cname,
    @required this.size,
    @required this.salary,
    @required this.username,
    @required this.title,
  });

  // 创建一个List 给Model层使用
  static List<Job> fromJson(String json){
    
    // 定一个数组_job返回给视图层使用、
    List<Job> _job=[];
    // 解析JSON格式
    JsonDecoder decoder=new JsonDecoder();
    // 定义一个变量来接收解析好的JSON
    var mapdata=decoder.convert(json)['list'];
    
    // 循环初始化
    // mapdata.forEach(obj){
    //   Job jo=new Job(
    //      name:obj['name'],
    //   );
    // };
    mapdata.forEach((obj){
        Job jb=new Job(
          name: obj['name'],
          cname: obj['cname']
        );
    });
  }
}
