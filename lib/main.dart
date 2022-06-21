import 'package:flutter/material.dart';

import 'main_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Favorite Movie',
      theme: ThemeData(fontFamily: "Oswald"),
      home: MainScreen(),
    );
  }
}
