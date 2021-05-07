import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'my_menu_itmes.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Drawer(
      child: Container(
        color: Theme.of(context).primaryColor,
        
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(accountName: Text("KTELLAWI"), accountEmail: Text("koutaiba@msn.com"),
            currentAccountPicture:Image.asset("assets/images/profile.jpeg")),
            SizedBox(
              height: 30,
            ),
            Divider(
              color:Colors.white,
            ),
            MyMenuItmes(),
          ],
        ),
      ),
    );
  }
}
