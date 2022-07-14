import 'package:first_chapter_flutter/detail_movie_state.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DetailScreen extends StatelessWidget {
  late Future<DetailMovieItem> futureDetailMovie;
  final int passedMovieId;

  DetailScreen(this.passedMovieId, {Key? key}) : super(key: key) {
    futureDetailMovie = fetchDetailMovie(http.Client(), passedMovieId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Fetch detail movie'),),
      body: SafeArea(
          child: SingleChildScrollView(
        child: FutureBuilder<DetailMovieItem>(
          future: futureDetailMovie,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                              "https://image.tmdb.org/t/p/w500${snapshot.data?.posterPath}"),
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        left: 10,
                        child: Container(
                          color: Colors.black54,
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            snapshot.data!.title,
                            style: const TextStyle(
                                fontSize: 16.0, color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      snapshot.data!.overview,
                      style: const TextStyle(fontSize: 16.0),
                      textAlign: TextAlign.justify,
                    ),
                  )
                ],
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      )),
    );
  }
}
