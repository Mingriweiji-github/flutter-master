import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutterapp/dart_type.dart';
import 'package:flutterapp/opp_learn.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter 必备Dart基础',
      theme: ThemeData(
//        primarySwatch: Colors.purple,
      primaryColor: Colors.white
      ),
      home: RandomWords() //MyHomePage(title: 'Flutter Demo Home Page')
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final List<WordPair> _suggestions = <WordPair>[];// List泛型集合初始化
  final Set<WordPair> _saved = Set<WordPair>();// Set泛型集合初始化
  final TextStyle _biggerFont = const TextStyle(fontSize: 18.0); //TextStyle初始化

  Widget _buildRow(WordPair wordPair) {
    final bool alreadySaved = _saved.contains(wordPair);
    return new ListTile(
      title: Text(
        wordPair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _saved.remove(wordPair);
          } else {
            _saved.add(wordPair);
          }
        });
      },

    );
  }
  Widget _buildSuggestions() {
    return ListView.builder(itemBuilder: (BuildContext _context, int i) {
          if(i.isOdd) {
            return Divider();
          }
          final int index = i ~/ 2;
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
      }
    );
  }
  @override
  Widget build(BuildContext context) {
//    final WordPair wordPair = WordPair.random();
//    return Text(wordPair.asPascalCase);
    return Scaffold(
      appBar: AppBar(
        title: Text("Start up name Generator"),
        actions: <Widget>[
          IconButton(icon: const Icon(Icons.list), onPressed: _pushSaved,)
        ],
      ),
      body: _buildSuggestions(),
    );
  }

  void _pushSaved() {
      Navigator.of(context).push(
        new MaterialPageRoute<Void>(
            // ignore: missing_return
            builder: (BuildContext context) {
              Iterable<ListTile> titles = _saved.map(
                  (WordPair pair) {
                    return ListTile(
                      title: Text(
                        pair.asPascalCase,
                        style: _biggerFont,
                      ),
                    );
                  }
              );
              List<Widget> divided = ListTile
                .divideTiles(tiles: titles, context: context)
                .toList();

              return Scaffold(
                appBar: AppBar(
                  title: Text("Saved Suggestions"),
                ),
                body: ListView(children: divided),
              );

            }
         )
      );
  }
}


//class MyHomePage extends StatefulWidget {
//  MyHomePage({Key key, this.title}) : super(key: key);
//  final String title;
//  @override
//  _MyHomePageState createState() => _MyHomePageState();
//}
//
//class _MyHomePageState extends State<MyHomePage> {
//
//  @override
//  Widget build(BuildContext context) {
////    _oop();
//    return Scaffold(
//      appBar: AppBar(
//        title: Text(widget.title),
//      ),
//      body: Center(
//        child: ListView(
//          children: <Widget>[
//            DartType()
//          ],
//        ),
//      ),
//
//    );
//
//
//  }
//
//  void _oop() {
//    Logger l1 = Logger();
//    Logger l2 = Logger();
////    print("logger1 == logger2 ?? ${l1 == l2}");
//  }
//}