import 'dart:ffi';

import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My first flutter',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
      ),
      home: Scaffold(
        body: Center(child: RandomWords()),
      ),
    );
  }
}

class RandomWords extends StatefulWidget {
  const RandomWords({Key? key}) : super(key: key);

  @override
  State createState() {
    return _RandomWordsState();
  }
}

class _RandomWordsState extends State<RandomWords> {
  final _listOfWords = <WordPair>[];
  final _saved = <WordPair>[];
  final _biggerFont = TextStyle(fontSize: 18);

  @override
  Widget build(BuildContext context) {
    void _pushSaved() {
      Navigator.of(context).push(MaterialPageRoute<Void>(builder: (context) {
        final tiles = _saved.map((e) => ListTile(
              title: Text(e.asPascalCase, style: _biggerFont),
            ));
        final divided = tiles.isNotEmpty
            ? ListTile.divideTiles(
                context: context,
                tiles: tiles,
              ).toList()
            : <Widget>[];

        return Scaffold(
            appBar: AppBar(
              title: const Text('Saved Suggestions'),
            ),
            body: ListView(children: divided));
      }));
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Startup name generator"),
        actions: <Widget>[
          IconButton(
            onPressed: _pushSaved,
            icon: const Icon(Icons.list),
            tooltip: "Saved suggestions",
          )
        ],
      ),
      body: ListView.builder(
          padding: EdgeInsets.all(16.0),
          itemCount: 10,
          itemBuilder: (context, index) {
            if (index.isOdd) return Divider();

            final indexes = index ~/ 2;
            if (indexes >= _listOfWords.length) {
              _listOfWords.addAll(generateWordPairs().take(10));
            }

            final alreadySaved = _saved.contains(_listOfWords[index]);

            return ListTile(
              trailing: Icon(
                  alreadySaved ? Icons.favorite : Icons.favorite_border,
                  color: alreadySaved ? Colors.red : null,
                  semanticLabel: alreadySaved ? "Removed from save" : "Save"),
              title: Text(_listOfWords[index].asPascalCase, style: _biggerFont),
              onTap: () {
                if (alreadySaved) {
                  _saved.remove(_listOfWords[index]);
                } else {
                  _saved.add(_listOfWords[index]);
                }
              },
            );
          }),
    );
  }
}
