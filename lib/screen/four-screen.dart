import 'dart:convert';
import 'dart:math';

import 'package:firstapp/models/photo.dart';
import 'package:firstapp/widgets/menu.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FourScreen extends StatefulWidget {
  @override
  _FourScreenState createState() => _FourScreenState();
}

class _FourScreenState extends State<FourScreen> {
  final List<String> mylist = [];
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("four screen"),
      ),
      drawer: MyDrawer(),
      body: Center(
          child:
              //mylist.length > 0
              //?
              Container(
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
          itemCount: mylist.length,
          itemBuilder: (BuildContext context, int index) {
            return _myBuildList(mylist[index]);
          },
        ),
      )
          // :
          // CircularProgressIndicator(
          //   strokeWidth: 10,
          //    backgroundColor: Colors.red,
          //  ),
          ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _addPhoto(),
      ),
    );
  }

  Widget _myBuildList(String img) {
    return Container(
      padding: EdgeInsets.only(bottom: 10),
      child: Card(elevation: 20, child: Image.network(img)),
    );
  }

  _addPhoto() async {
    final num = Random().nextInt(2000);
    final response = await http.get(Uri.parse("http://jsonplaceholder.typicode.com/photos/1"));
    final parsedResponse = json.decode(response.body);
    final photo = Photo(
        id: parsedResponse['id'],
        albumId: parsedResponse['albumId'],
        title: parsedResponse['title'],
        url: parsedResponse['url']);
    setState(() {
      mylist.add(photo.url);
    });
    print(mylist.length);
  }
}
