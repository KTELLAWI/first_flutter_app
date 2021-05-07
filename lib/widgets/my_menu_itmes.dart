import 'package:flutter/material.dart';

class MyMenuItmes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Card(
          elevation: 10,
          child: ListTile(
            title: Text("homeScreen"),
            onTap: () =>{ Navigator.of(context).pushNamed('/')}
          ),
        ),
        Card(
          elevation: 10,
          child: ListTile(
            title: Text("SecondScreen"),
          ),
        ),
        Card(
          elevation: 10,
          child: ListTile(
            title: Text("ThirdScreen"),
            onTap: () =>{
              Navigator.of(context).pushNamed('/third')
            }
          ),
        ),
        Card(
          elevation: 10,
          child: ListTile(
            title: Text("FourScreen"),
            onTap: () =>{
              Navigator.of(context).pushNamed('/four')
            }
          ),
        ),
        Card(
          elevation: 10,
          child: ListTile(
            title: Text("FiveScreen"),
            onTap: () =>{
              Navigator.of(context).pushNamed('/five')
            }
          ),
        ),
         Card(
          elevation: 10,
          child: ListTile(
            title: Text("LoginScreen"),
            onTap: () =>{
              Navigator.of(context).pushNamed('/login')
            }
          ),
        ),
        Card( 
          elevation: 10,
          child: ListTile(
            title: Text("contacts"),
            onTap: () =>{
              Navigator.of(context).pushNamed('/contacts')
            }
          ),
        ),
      ],
    );
  }
}
