// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/widgets.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: RandomWords(),
      ),
      );
  }
}

class RandomWords extends StatefulWidget {
  const RandomWords({Key? key}) : super(key: key);

  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0, color: Color.fromRGBO(30, 10, 123, 1), fontWeight: FontWeight.bold);
  final _textDire = TextDirection.ltr;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const IconButton(
            onPressed: null,
            icon: Icon(Icons.account_tree)),
        title: const Text('توزيع', textDirection: TextDirection.ltr,),
        actions: [
          IconButton(onPressed: null, icon: Icon(Icons.ac_unit_outlined)),
          IconButton(onPressed: null, icon: Icon(Icons.alarm_on_sharp)),
        ],
      ),
      body: _buildListView(),
      floatingActionButton: const FloatingActionButton(
          onPressed: null,
          child: Icon(Icons.add),
          tooltip: 'Add',
      ),
      );
  }

  Widget _buildListView() {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, i) {
        if (i.isOdd) return const Divider();
        final index = i ~/ 2;
        if (index >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_suggestions[index]);
      }
    );
  }

  Widget _buildRow(WordPair pair) {
    return ListTile(
      title: Text(
        pair.asSnakeCase,
        style: _biggerFont,
        textDirection: _textDire,
      ),
    );
  }
}


