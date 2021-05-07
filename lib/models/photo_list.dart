//import 'dart:convert';

//import 'package:firstapp/models/photo.dart';
//import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
//import 'package:http/http.dart' as http;

class PhotoList extends StatelessWidget {
  final photos;
  PhotoList({this.photos});
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: photos.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          width: 200,
          height: 200,
          child: Image.network(photos[index].url),
        );
      },
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
    );
  }
}
