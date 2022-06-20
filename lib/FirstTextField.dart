import 'package:flutter/material.dart';

class FirstTextField extends StatefulWidget {
  @override
  State createState() {
    return FirstTextFieldState();
  }
}

class FirstTextFieldState extends State<FirstTextField> {
  TextEditingController _controller = new TextEditingController();
  String _input = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("First text field")),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                  hintText: "Input your name", labelText: "Top label"),
              onChanged: (String value) {
                setState(() {
                  _input = value;
                });
              },
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                            title: Text("Dialog tittle"),
                            content: Text("isi dialog adalah $_input"));
                      });
                },
                child: Text("Submit"))
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
