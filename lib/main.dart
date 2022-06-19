import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: FirstScaffoldScreen()

        // home: Scaffold(
        //   appBar: AppBar(
        //     title: const Text('Hello, world!'),
        //   ),
        //   body: const Center(
        //     child: BiggerText(text: 'Hello, world!'),
        //     // child: Heading(text: 'Hello, world!'),
        //   ),
        // ),
        );
  }
}

class Heading extends StatelessWidget {
  final String text;

  const Heading({required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold));
  }
}

class BiggerText extends StatefulWidget {
  final String text;

  const BiggerText({required this.text});

  @override
  State createState() {
    return _BiggerTextState();
  }
}

class _BiggerTextState extends State<BiggerText> {
  double _textSize = 16.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(widget.text, style: TextStyle(fontSize: _textSize)),
        ElevatedButton(
            onPressed: () {
              setState(() {
                _textSize = 32.0;
              });
            },
            child: const Text("Perbesar"))
      ],
    );
  }
}

class FirstScaffoldScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(Icons.menu, color: Colors.white),
            onPressed: () {}),
        title: const Text("First Chapter"),
        actions: <Widget>[
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search, color: Colors.white))
        ],
      ),
      body: Center(
        child: StatelessContainer(),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}

class StatelessContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Text("aku adalah stateless container",
            style: TextStyle(fontSize: 30)),
        decoration: BoxDecoration(
            color: Colors.blueGrey,
            shape: BoxShape.rectangle,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey, offset: Offset(3, 6), blurRadius: 10)
            ],
            border: Border.all(color: Colors.red, width: 2),borderRadius: BorderRadius.circular(10)),
        margin: EdgeInsets.all(10));
  }
}
