import 'package:flutter/material.dart';

class FirstNetworkImage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("first image")),
      body: Container(
        alignment: Alignment.center,
        child: Image.network('https://picsum.photos/200/300',height: 200,width: 200),
      ),
    );
  }
}

class FirstAssetImage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("first image")),
      body: Container(
        alignment: Alignment.center,
        child: Image.asset('images/ic_gym.jpg',height: 200,width: 200),
      ),
    );
  }
}

