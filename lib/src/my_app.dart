
import 'package:flutter/material.dart';
//import 'package:flutter/rendering.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        home: Scaffold(
      drawer: _myAPP(),
      appBar: AppBar(
        title:Text("my APP1"),
        centerTitle:true,
      ),
      body:_list(), 
    )
    );
  }
}

Widget _myAPP(){
 return  Drawer(
        child:ListView(
          children: <Widget>[
           ListTile(
            title: Text("MENI1"),
            onTap: () {
              print("hhhhh");
            },
            ),
             ListTile(
            title: Text("MENI1"),
            onTap: () {
              print("hhhhh");
            },
            ),  
          ],
        ),
      );

}

Widget _list(){
  return ListView(
        children: <Widget>[
        ListTile(
            title: Text("item1"),
            onTap: () {
              print("hhhhh");
            },
            ),
             ListTile(
            title: Text("item1"),
            onTap: () {
              print("hhhhh");
            },
            ),
             ListTile(
            title: Text("item1"),
            onTap: () {
              print("hhhhh");
            },
            ),
             ListTile(
            title: Text("item1"),
            onTap: () {
              print("hhhhh");
            },
            ),
             ListTile(
            title: Text("item1"),
            onTap: () {
              print("hhhhh");
            },
             ),
             ListTile(
            title: Text("item1"),
            onTap: () {
              print("hhhhh");
            },
            ),
             ListTile(
            title: Text("item1"),
            onTap: () {
              print("hhhhh");
            },
            ),
             ListTile(
            title: Text("item14"),
            onTap: () {
              print("hhhhh");
            },
            ),
             ListTile(
            title: Text("item14"),
            onTap: () {
              print("hhhhh");
            },
            ),
             ListTile(
            title: Text("item3"),
            onTap: () {
              print("hhhhh");
            },
            ),
             ListTile(
            title: Text("item2"),
            onTap: () {
              print("hhhhh");
            },
            ),
            ListTile(
            title: Text("item2"),
            onTap: () {
              print("hhhhh");
            },
            ),
            ListTile(
            title: Text("item2"),
            onTap: () {
              print("hhhhh");
            },
            ),
            ListTile(
            title: Text("item2"),
            onTap: () {
              print("hhhhh");
            },
            ),
            
      ]
      );

}