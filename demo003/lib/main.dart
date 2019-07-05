import 'package:flutter/material.dart';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context){
     var card=new Card(
     child: Column(//垂直布局
      children: <Widget>[
        ListTile(
           leading: new Icon(Icons.account_box,color: Colors.lightBlue,),
          title: Text('湖南省长沙市芙蓉区',style: TextStyle(fontWeight: FontWeight.w500),),
          subtitle: Text('JasonLong'),
         
        ),
        new Divider(),
        ListTile(
          leading: new Icon(Icons.account_box,color: Colors.lightBlue,),
          title: Text('湖南省长沙市雨花区',style: TextStyle(fontWeight: FontWeight.w500),),
          subtitle: Text('张小三'),
          
        ),
         new Divider(),
        ListTile(
           leading: new Icon(Icons.account_box,color: Colors.lightBlue,),
          title: Text('湖南省长沙市岳麓区',style: TextStyle(fontWeight: FontWeight.w500),),
          subtitle: Text('网二'),
         
        )
      ],
     ),
     );
    return MaterialApp(
      title: 'Row',
      home: Scaffold(
        appBar: new AppBar(
          title: new Text('垂直方向布局'),
        ),
        body:Center(
          child: card
        ) 
      ),
    );
  }
  
}