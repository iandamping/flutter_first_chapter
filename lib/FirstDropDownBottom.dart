import 'package:flutter/material.dart';

class FirstDropDownBottom extends StatefulWidget {
  @override
  State createState() {
    return DropDownBottomState();
  }
}

class DropDownBottomState extends State<FirstDropDownBottom> {
  String? language;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("first dropdown")),
        body: DropdownButton<String>(
          items: <DropdownMenuItem<String>>[
            DropdownMenuItem(child: Text("Dart"), value: "Dart"),
            DropdownMenuItem(child: Text("Kotlin"), value: "Kotlin"),
            DropdownMenuItem(child: Text("Java"), value: "Java")
          ],
          value: language,
          hint: Text("Select fav languange"),
          onChanged: (String? value) {
            setState(() {
              language = value;
            });
          },
        ));
  }
}
