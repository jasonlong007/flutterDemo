import 'package:flutter/material.dart';
import 'package:flutter_shopping/provide/counter.dart';
import 'package:provide/provide.dart';


class MemberPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Provide<Counter>(
        builder: (context,child,counter){
         return Text(
           '数字变化：${counter.value}'
         );
        },
        ),
      ),
    );
  }
}