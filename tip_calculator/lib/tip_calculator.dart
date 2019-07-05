
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TipCalculator extends StatelessWidget {
  double billAmount=0.0;
  double tipPercenttage=0.0;
  
  
  
  @override
  Widget build(BuildContext context) {
    // 创建一个输入框
  TextField billAmoutField=new TextField(
     keyboardType: TextInputType.number,//输入的类型
     onChanged: (String val){//文件改变触发
      try {
        billAmount=double.parse(val);
      } catch (e) {
        billAmount=0.0;
      }
     },
     decoration: InputDecoration(//描述输入框
       labelText: 'BILL amount (\$)'
     ),
  );
  
  //  创建另外一个输入框
  TextField tipPercenttageField=TextField(
    decoration: InputDecoration(labelText: 'Tip %',hintText: '15'),
    keyboardType: TextInputType.number,
    maxLength: 10,
    onChanged: (String val){
     try {
       tipPercenttage=double.parse(val);
     } catch (e) {
       tipPercenttage=0.0;
     }
    },
  );
  
  // 创建一个提交的按钮
  RaisedButton calculateButton=RaisedButton(
    child: Text('Calculate'),
    onPressed: (){
      // 计算小费和总数
      double calculatedTip=billAmount*tipPercenttage/100.0;
      double total=billAmount+calculatedTip;
      // 生成一个对话框
      AlertDialog dialog=AlertDialog(
        content: Text(
          'Tip:\$ $calculatedTip \n''Total:\$ $total'
        ),
      );
      showDialog(
        context: context,
        builder: (BuildContext context){
          return dialog;
        }
      );

    },
  );

  Container container=Container(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      children: <Widget>[
        billAmoutField,tipPercenttageField,calculateButton
      ],
    ),
  );
  AppBar appBar=AppBar(
    title: Text('Tip Calilator'),
  );
  Scaffold scaffold =Scaffold(appBar: appBar,body: container,);

    return scaffold;
  }
}