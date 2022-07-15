import 'package:first_chapter_flutter/detail_screen.dart';
import 'package:first_chapter_flutter/screen_argument.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  static const routeName = 'mainScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Screen'),
      ),
      body: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, DetailScreen.routeName,
              arguments:
                  ScreenArgument(title: "Detail", message: "Detail Message"));
        },
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                tag: "imageHero",
                child: Image.network(
                  'https://picsum.photos/250?image=9',
                ),
              ),
              Text("Home")
            ],
          ),
        ),
      ),
    );
  }
}
