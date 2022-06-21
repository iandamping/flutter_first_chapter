import 'package:first_chapter_flutter/detail_screen.dart';
import 'package:first_chapter_flutter/model/Movies.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Favorite Movies"),
        ),
        body: ListView.builder(
            padding: EdgeInsets.all(8.0),
            itemBuilder: (context, index) {
              final Movies movie = moviesList[index];
              return InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return DetailScreen(passedMovie: movie);
                    }));
                  },
                  child: Card(
                    child: Column(
                      children: <Widget>[
                        Stack(
                          children: <Widget>[
                            Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(movie.imageAsset)),
                            Positioned(
                              bottom: 10,
                              right: 10,
                              child: Container(
                                color: Colors.black54,
                                padding: const EdgeInsets.all(10.0),
                                child: Text(
                                  movie.tittle,
                                  style: const TextStyle(
                                      fontSize: 16.0, color: Colors.white),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ));
            },
            itemCount: moviesList.length));
  }
}
