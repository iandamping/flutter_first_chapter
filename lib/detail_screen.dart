import 'package:first_chapter_flutter/model/Movies.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final Movies passedMovie;

  const DetailScreen({required this.passedMovie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(passedMovie.imageAsset)),
                  Positioned(
                    bottom: 10,
                    left: 10,
                    child: Container(
                      color: Colors.black54,
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        passedMovie.tittle,
                        style: const TextStyle(
                            fontSize: 16.0, color: Colors.white),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: CircleAvatar(
                          backgroundColor: Colors.grey,
                          child: IconButton(
                              icon: Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              }),
                        ),
                      ),
                      FavoriteButton(),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  passedMovie.description,
                  style: const TextStyle(fontSize: 16.0),
                  textAlign: TextAlign.justify,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class FavoriteButton extends StatefulWidget {
  @override
  State createState() {
    return FavoriteButtonState();
  }
}

class FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: () {
      setState((){
        isFavorite = !isFavorite;
      });
    }, icon: Icon((isFavorite ? Icons.bookmark : Icons.bookmark_border),
      color: Colors.grey,));
  }
}
