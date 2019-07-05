import 'package:flutter/material.dart';
import 'assert.dart';


class SearchBarDemo extends StatefulWidget {
  @override
  _SearchBarDemoState createState() => _SearchBarDemoState();
}

class _SearchBarDemoState extends State<SearchBarDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search your want'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: (){
              print('点击了');
              showSearch(context: context,delegate: searchBarDelegate());
            },
          )
        ],
      ),
    );
  }
}

class searchBarDelegate extends SearchDelegate<String> {
   @override
  //  清楚图标
  List<Widget> buildActions(BuildContext context) {
     return [
       IconButton(
         icon: Icon(Icons.clear),
         onPressed: ()=>query='',
       )
     ];
   }

   @override
   Widget buildLeading(BuildContext context){
     return IconButton(
       icon: AnimatedIcon(
         icon: AnimatedIcons.menu_arrow,progress: transitionAnimation,
       ),
       onPressed: (){
         close(context, null);
       },
     );
   }

   @override
   Widget buildResults(BuildContext context){
    return Container( 
      width: 100.0,
      height: 100.0,
      child: Card(
        color: Colors.redAccent,
        child: Center(
          child: Text(query),
        ),
      ),
    );
   }

   @override 
   Widget buildSuggestions(BuildContext context){
   final suggestionsList=query.isEmpty
   ?recentSuggest:searchList.where((input)=>input.startsWith(query)).toList();
      return ListView.builder(
        itemCount: suggestionsList.length,
        itemBuilder: (BuildContext context, int index) {//构造器
        return ListTile(
          title: RichText(
            text: TextSpan(
              text:  suggestionsList[index].substring(0,query.length),//截取搜索到的字符字符串
              style: TextStyle(
                color: Colors.black,fontWeight: FontWeight.bold
              ),
              children: [
                TextSpan(
                  text: suggestionsList[index].substring(query.length),
                  style: TextStyle(color: Colors.grey)
                )
              ]
            ),
            
          ),
        );
        },
      );
   
   }
}
