//import 'package:firstapp/src/my_app.dart';
//import 'package:english_words/english_words.dart';
//import 'package:firstapp/screen/second_screen.dart';
import 'package:firstapp/blocs/auth_bloc.dart';
import 'package:firstapp/blocs/auth_state.dart';
import 'package:firstapp/repository/auth_repo.dart';
import 'package:firstapp/screen/getcontacts_screen.dart';
import 'package:firstapp/screen/login_screen.dart';
import 'package:firstapp/screen/postcontacts_screen.dart';
import 'package:firstapp/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'screen/Home_Screen.dart';
//import 'screen/second_screen.dart';
import 'screen/five_Screen.dart';
import 'screen/four-screen.dart';
import 'screen/third_screen.dart';
//import 'package:flutter/rendering.dart';
//import 'package:english_words/english_words.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      
        create:(context) => AuthBloc(InitState(c:0),Authrepository()),
        
              
        child: MaterialApp(
                theme: myThemeData,
               // home: HomeScreen(),
                initialRoute: true ?  '/' : '/third',
               routes: {
                 "/" :(context)=> HomeScreen(),
                 "/third" :(context)=> ThirdScreen(),
                 "/four" :(context)=> FourScreen(),
                 "/five" :(context)=> FiveScreen(),
                  "/login":(context)=>LoginUi(),
                  '/contacts' :(context)=> GetContacts(),
                  '/addcontacts':(context)=>AddContacts(),
                 
                         
                       },
                        //theme: ThemeData.dark(),
                       debugShowCheckedModeBanner: true,
                      
                     ),
            );
                 }
        
       }
       

