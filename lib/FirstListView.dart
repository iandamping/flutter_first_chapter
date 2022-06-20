import 'package:flutter/material.dart';

class FirstDynamicListView extends StatelessWidget {
  final List<int> listOfNumbers = <int>[0, 1, 2, 3, 4, 5, 6, 7, 8];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: listOfNumbers.map((e) {
          return Container(
              height: 250,
              decoration: BoxDecoration(
                color: Colors.grey,
                border: Border.all(color: Colors.black),
              ),
              child: Center(
                child: Text(
                  '$e', // Ditampilkan sesuai item
                  style: TextStyle(fontSize: 50),
                ),
              ));
        }).toList(),
      ),
    );
  }
}
