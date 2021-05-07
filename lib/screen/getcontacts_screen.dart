import 'package:firstapp/models/contacts.dart';
import 'package:firstapp/models/photo.dart';
import 'package:firstapp/screen/contact_List.dart';
import 'package:firstapp/widgets/menu.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class GetContacts extends StatefulWidget {
  @override
  _GetContactsState createState() => _GetContactsState();
}

class _GetContactsState extends State<GetContacts> {
  final mylist = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      //drawer: MyDrawer(),
      body: Center(
        child: FutureBuilder(
          future: fetchPhotos(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            return Center(
              child: snapshot.hasData
                  ? ContactsList(results: snapshot.data)
                  : CircularProgressIndicator(),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => getContacts(),
      ),
    );
  }

  Widget _buildSugesstion() {
    return ListView.builder(
      itemCount: mylist.length,
      itemBuilder: (BuildContext context, int i) {
        return _buildRow(mylist.length);
      },
    );
  }

  Widget _buildRow(int contacts) {
    return ListTile(
      subtitle: Text(contacts.toString()),
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
      title: Text(contacts.toString()),
    );
  }

  getContacts() async {
    //final num = Random().nextInt(2000);
    //SharedPreferences prefs = await SharedPreferences.getInstance();

    //final token = (prefs.getString('token')??'');

    final response = await http.get(
      Uri.parse("http://jsonplaceholder.typicode.com/photos"),

      //"https://us-central1-backend-endpointapi.cloudfunctions.net/api1/contacts"),
      // headers: {
      // "authorization":
      //    "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InNvcGhpYUBnbWFpbC5jb20iLCJuYW1lIjoic29waGlhIiwiaWF0IjoxNjE5NDQ5NjA3fQ.yCOK6CiHQDwxp_6KlDQEmr31LL6uqq7JaMpFnroRn8Q"
      // },
    );

    final responseBody = response.body;
    final parsed = json.decode(responseBody);

    //final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    //print(parsed);
    setState(() {
      mylist.add(parsed);
      //mylist.add(parsed);
      print(mylist);
    });
    //return parsed.map<Contacts>((json) => Contacts.fromJson(json)).toList();
  }
}

/**Future<List<Contacts>> getContacts() async {
  final response = await http.get(Uri.parse("https://us-central1-backend-endpointapi.cloudfunctions.net/api1/contacts"),
//"https://my-json-server.typicode.com/typicode/demo/posts"),
 headers: {
"authorization":
   "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InNvcGhpYUBnbWFpbC5jb20iLCJuYW1lIjoic29waGlhIiwiaWF0IjoxNjE5NDQ5NjA3fQ.yCOK6CiHQDwxp_6KlDQEmr31LL6uqq7JaMpFnroRn8Q"
   },
  );  

  final responseBody = response.body;

  return compute(parsePhoto, responseBody);
}

List<Contacts> parsePhoto(String responseBody) {
  final parsed = json.decode(responseBody)
  //.cast<Map<String, dynamic>>();
  print(parsed);
  return parsed.map<Contacts>((json) => Contacts.fromJson(json)).toList();
}

*/

/**getContacts() async {
  //final num = Random().nextInt(2000);
  //SharedPreferences prefs = await SharedPreferences.getInstance();

  //final token = (prefs.getString('token')??'');

  final response = await http.get(
  Uri.parse(
  "https://us-central1-backend-endpointapi.cloudfunctions.net/api1/contacts"),
  headers: {
 "authorization":    "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InNvcGhpYUBnbWFpbC5jb20iLCJuYW1lIjoic29waGlhIiwiaWF0IjoxNjE5NDQ5NjA3fQ.yCOK6CiHQDwxp_6KlDQEmr31LL6uqq7JaMpFnroRn8Q"
  },
  );

  final responseBody = response.body;
  //final pars = jsonDecode(responseBody);
  final parsed = json.decode(responseBody);
   
  //.cast<Map<String, dynamic>>();
  // final result= parsed.map<Contacts>((json) => Contacts.fromJson(json)).toList();

  print(parsed);

  return parsed;

  //final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

  //return parsed.map<Contacts>((json) => Contacts.fromJson(json)).toList();
}
*/
///////////////////////////////
//Future<List<Contacts>>

//}
//Future<List<Contacts>> 
fetchPhotos() async {
  SharedPreferences pref = await SharedPreferences.getInstance();

  String token = pref.getString("token");
  String auth = "Bearer" + " " + token;
  print(auth);
  print(token);
  final response = await http.get(
    Uri.parse(
        "https://us-central1-backend-endpointapi.cloudfunctions.net/api1/contacts"),
    headers: {
      "authorization":auth,
         //"Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InNvcGhpYUBnbWFpbC5jb20iLCJuYW1lIjoic29waGlhIiwiaWF0IjoxNjE5NDQ5NjA3fQ.yCOK6CiHQDwxp_6KlDQEmr31LL6uqq7JaMpFnroRn8Q"

      //auth,
    },
  );

  final responseBody = response.body;
       pref.remove("token");

  return compute(parsePhoto, responseBody);
}

//List<Contacts>
 parsePhoto(String responseBody) {
     //SharedPreferences pref = await SharedPreferences.getInstance();


  final parsed =
      json.decode(responseBody)['results'].cast<Map<String, dynamic>>();
 // return parsed.map<Contacts>((json) => Contacts.fromJson(json)).toList();
  //print(parsed);

   return parsed;
}

fetchPhotos1() async {
  SharedPreferences pref = await SharedPreferences.getInstance();

  String token = pref.getString("token");
  String auth = "Bearer" + " " + token;
  print(auth);
  print(token);
  final response = await http.get(
    Uri.parse(
        "https://us-central1-backend-endpointapi.cloudfunctions.net/api1/contacts"),
    headers: {
      "authorization": auth,
      //"Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InNvcGhpYUBnbWFpbC5jb20iLCJuYW1lIjoic29waGlhIiwiaWF0IjoxNjE5NDQ5NjA3fQ.yCOK6CiHQDwxp_6KlDQEmr31LL6uqq7JaMpFnroRn8Q"
    },
  );

  final responseBody = response.body;

  final parsed =
      json.decode(responseBody)['results'].cast<Map<String, dynamic>>();
  print(parsed);
  return parsed;
  //parsed.map<Contacts>((json) => Contacts.fromJson(json)).toList();

  //final parsed = json.decode(responseBody);
  //var tagObjsJson =  json.decode(responseBody)['results'].cast<Map<String, dynamic>>();
  //jsonDecode(responseBody)['results'] as List;
  // List<Contacts>
  // final  tagObjs  = tagObjsJson.map((tagJson) => Contacts.fromJson(tagJson)).toList();

  // final parsed2 = json.decode(parsed).cast<Map<String, String>>();
  //final parsed3=parsed2.map<Contacts>((json) => Contacts.fromJson(json)).toList();

  //final dsg= Contacts();
  //final d = parsed.toList();
  //.map((json) => Contacts.fromJson(json)).toList();
  // print(tagObjs);
  //return tagObjs;

  // return compute(parsePhoto, responseBody);

  //return responseBody ;
  //return parsed;
}
