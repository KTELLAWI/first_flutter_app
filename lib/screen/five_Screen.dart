import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:firstapp/models/photo.dart';
import 'package:firstapp/models/photo_list.dart';
import 'package:firstapp/widgets/menu.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class FiveScreen extends StatelessWidget {
  final myList = [];
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("f screen"),
      ),
      drawer: MyDrawer(),
      body: Center(
        child: FutureBuilder(
          future: fetchPhotos(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            return Center(
              child: snapshot.hasData
                  ? PhotoList(photos: snapshot.data)
                  : CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}

Future<List<Photo>> fetchPhotos() async {
  final response =
      await http.get(Uri.parse("http://jsonplaceholder.typicode.com/photos"));
      
  final responseBody = response.body;

  return compute(parsePhoto, responseBody);
}

List<Photo> parsePhoto(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Photo>((json) => Photo.fromJson(json)).toList();
}
