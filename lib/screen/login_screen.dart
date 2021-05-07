import 'package:firstapp/blocs/auth_bloc.dart';
import 'package:firstapp/blocs/auth_events.dart';
import 'package:firstapp/blocs/auth_state.dart';
import 'package:firstapp/widgets/menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginUi extends StatefulWidget {
  @override
  _LoginUiState createState() => _LoginUiState();
}

class _LoginUiState extends State<LoginUi> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  AuthBloc authBloc;
  @override
  void initState() {
    authBloc = BlocProvider.of<AuthBloc>(context);
    super.initState();
  }

  Widget build(BuildContext context) {
    final logo = Center(
      child: Icon(Icons.supervised_user_circle, size: 150, color: Colors.orange),
    );

    // ignore: missing_required_param
    final msg = BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is LoginLoadingState) {
          return LinearProgressIndicator(
            backgroundColor: Colors.orange,

          );
          
          //Text(state.c.toString());
        }
        else if (state is CountingState) {
          return Text(state.c.toString(), style:TextStyle(color: Colors.white));
        }
        else if (state is InitState) {
          return Text(state.c.toString(), style:TextStyle(color: Colors.white));
        }
        else if (state is LoginErrorState){
          return Text(state.message, style:TextStyle(color: Colors.white));

        }
        else {
          return Container();
        }
      },
    );

    final username = TextField(
      controller: email,
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.email),
          filled: true,
          fillColor: Color(0xfff2f3f5),
          hintStyle: TextStyle(
            color: Color(0xff666666),
          ),
          hintText: "email",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(23)),
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0)),
    );

    final pass = TextField(
      controller: password,
      obscureText: true,
      autofocus: false,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.lock),
          filled: true,
          fillColor: Color(0xfff2f3f5),
          hintStyle: TextStyle(
            color: Color(0xff666666),
          ),
          hintText: "password",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(23)),
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0)),
    );

    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () {
           authBloc.add(
          LoginButtonPressed(email:email.text,password:password.text));
          print("heelo worlffffff");
        },
        padding: EdgeInsets.all(12),
        color: Colors.orange,
        child: Text(
          "LOGIN",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );

    return Scaffold(
      
      backgroundColor: Colors.black,
      appBar: AppBar(),
      drawer: MyDrawer(),
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is UserLoginSuccessState) {
            return Navigator.pushNamed(context, '/contacts');
          }
          else if (state is AdminLoginSuccessState){
             return Navigator.pushNamed(context, '/addcontacts');
          }
        },
        child: Center(
          child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.only(left: 24.0, right: 24.0),
              children: <Widget>[
                logo,
                SizedBox(height: 20.0),
                msg,
                SizedBox(height: 20.0),
                username,
                SizedBox(height: 20.0),
                pass,
                SizedBox(height: 20.0),
                loginButton,
                SizedBox(height: 20.0),
              ]),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.orange,
        onPressed: () {
          authBloc.add(CountingEvent());
        },
      ),
    );
  }
}
