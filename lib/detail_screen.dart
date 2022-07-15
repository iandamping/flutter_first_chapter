import 'package:first_chapter_flutter/favorite_screen.dart';
import 'package:first_chapter_flutter/screen_argument.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  static const routeName = 'detailScreen';

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ScreenArgument;

    return Scaffold(
      appBar: AppBar(
        title: Text(args.title),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, FavoriteScreen.routeName,
                  arguments: ScreenArgument(
                      title: "Favorite", message: "Favorite Message"));
            },
            child: Icon(Icons.favorite),
          )
        ],
      ),
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
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
              Text(args.message),
            ],
          ),
        ),
      ),
    );
  }
}
