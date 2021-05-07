import 'package:firstapp/widgets/menu.dart';
import 'package:flutter/Material.dart';

class SecondScreen extends StatelessWidget {
  final pair;
  SecondScreen(this.pair);
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(),
      body: Container(
        child: Center(child: Text(pair.toString(),
      style:TextStyle(
        fontSize: 90,
        color:Colors.blue,
      ),
      ),
      ),
      ),
    );
  }
}
 