import 'package:flutter/material.dart';

class ContactsList extends StatelessWidget {
  final results;
 
  ContactsList({this.results});
  @override
  Widget build(BuildContext context) {
    //print(results[0].name);
    return new Scaffold(
      body: _buildSugesstion(),
      
    );
  }

  Widget _buildSugesstion() {
     print(results);
    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (BuildContext context, int index) {
        return _buildRow(results,index);
      },
    );
  }

  Widget _buildRow(List result,int i) {
    return ListTile(
      subtitle: Text(result[i]["phone"].toString()),
      trailing: Icon(
        Icons.favorite,
        color: Colors.orange,
      ),
      leading: CircleAvatar(
        child: FlutterLogo(
          size: 35,
          textColor: Colors.red,
        ),
      ),
      title: Text(result[i]["name"].toString()),
    );
  }
}
