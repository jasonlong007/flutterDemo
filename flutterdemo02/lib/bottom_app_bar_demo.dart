import 'package:flutter/material.dart';
import 'each_view.dart';

// 动态要继承StatefulWidget
class BottomAppBarDemo extends StatefulWidget {
  @override
  _BottomAppBarDemoState createState() => _BottomAppBarDemoState();
}

class _BottomAppBarDemoState extends State<BottomAppBarDemo> {
  List<Widget> _eachView;
  int _index=0;
  // 初始化
 @override
  void initState() { 
    super.initState();
    _eachView=List();
    _eachView..add(EchView('zzzzhome'))..add(EchView('Jasonaaaa'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:_eachView[_index],
      floatingActionButton: FloatingActionButton(
        onPressed: (){
         Navigator.of(context).push(
          MaterialPageRoute(
            builder:(BuildContext context){
              return EchView('new Page');
            }
          )
         );
        },
        tooltip: 'JasonLong',
        child: Icon(Icons.add,color:Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.lightBlue,
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home),
              color: Colors.white,
              onPressed: (){
                setState(() {
                 _index=0; 
                });
              },
            ),
             IconButton(
              icon: Icon(Icons.airplay),
              color: Colors.white,
              onPressed: (){
                  setState(() {
                 _index=1; 
                });
              },
            ),
            
          ],
        ),
      ),
    );
  }
}