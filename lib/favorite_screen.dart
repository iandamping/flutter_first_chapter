import 'package:first_chapter_flutter/screen_argument.dart';
import 'package:flutter/material.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  static const routeName = 'favoriteScreen';

  @override
  Widget build(BuildContext context) {

    final args = ModalRoute.of(context)!.settings.arguments as ScreenArgument;

    return Scaffold(
      appBar: AppBar(title: Text(args.title)),

      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                'https://picsum.photos/250?image=9',
              ),
              Text(args.message)
            ],
          ),
        ),
      ),
    );
  }
}
