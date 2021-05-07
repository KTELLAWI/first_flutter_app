//import 'dart:io';

import 'dart:convert';
import 'package:http/http.dart' as http;
//port 'package:http/http.dart';

class Authrepository {
 
  login(String email, String password) async {
   // String url = Uri.parse("https://us-central1-backend-endpointapi.cloudfunctions.net/api1/auth/login");
   
    //final res = await http.post(Uri.parse("https://us-central1-backend-endpointapi.cloudfunctions.net/api1/auth/login"),
      var response = await http.post(Uri.parse("https://us-central1-backend-endpointapi.cloudfunctions.net/api1/auth/login"), 
      headers:{"email": email,"password": password},
   );
       
    //);
    final data = json.decode(response.body);
    if (data['message'] == "user has login successfully" || data['message']== "admin has login successfully") {
      return data;
    } else {
      return "AUTH problem";
    }
  }


  


}
