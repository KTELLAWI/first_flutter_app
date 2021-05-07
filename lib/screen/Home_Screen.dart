import 'package:firstapp/screen/second_screen.dart';
import 'package:firstapp/widgets/menu.dart';
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';




class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _suggestions = <WordPair>[];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(title: Text("MY NEW APP")),
      body: _buildSugesstion(),
    );
  }

  Widget _buildSugesstion() {
    return ListView.builder(
      itemBuilder: (BuildContext context, int i) {
        if (i.isOdd) return Divider();
        final int index = i ~/ 2;
        if (index >= _suggestions.length) {

          // ...then generate 10 more and add them to the
          // suggestions list.
          _suggestions.addAll(generateWordPairs().take(10));

        }

        return _buildRow(_suggestions[index]);
      },
    );
  }


  Widget _buildRow(WordPair pair) {
    return ListTile(
        subtitle: Text("my STAUTS"),
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
        title: Text(
          pair.asPascalCase,
        ),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) => SecondScreen(pair),
            ),
          );
        });
  }
}
