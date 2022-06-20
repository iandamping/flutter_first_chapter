import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Text")),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return SecondScreen("Passed");
              }));
            },
            child: Text("Pindah screen")),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  final String passedMessage;

  const SecondScreen(this.passedMessage);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Second screen")),
      body: Center(
        child: OutlinedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("Kembali")),
      ),
    );
  }
}
