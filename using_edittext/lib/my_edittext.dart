import 'package:flutter/material.dart';


class MyEditText extends StatefulWidget {
  @override
  _MyEditTextState createState() => _MyEditTextState();
}

class _MyEditTextState extends State<MyEditText> {
  // 定义一个变量来接受结果
  String results="";

  // 定义输入框的控制器
 final TextEditingController controller=new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Using EditText'),
        backgroundColor: Colors.redAccent,
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          // 子孩子控件完全填充交叉轴方向的空间
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(hintText: "Enter text here...."),
              onSubmitted: (String str){//内容提交（按回车）的回调
               setState(() {
                results=results+"\n"+str;
                controller.text=""; 
               });
              },
              controller: controller,
              maxLength: 30,
              autofocus: true,
            ),
            Text(results)
          ],
        ),
      ),
    );
  }
}