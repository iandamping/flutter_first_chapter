import 'package:first_chapter_flutter/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'movie_state.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  late Future<MovieResponse> futureMovie;

  @override
  void initState() {
    super.initState();
    futureMovie = fetchMovie(http.Client());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Fetch Movie'),
        ),
        body: Center(
          child: FutureBuilder<MovieResponse>(
              future: futureMovie,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      padding: const EdgeInsets.all(8.0),
                      itemCount: snapshot.data?.listOfMovies.length,
                      itemBuilder: (context, index) {
                        final MovieItem movie =
                            snapshot.data!.listOfMovies[index];

                        return InkWell(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return DetailScreen(movie.movieId);
                            }));
                          },
                          child: Card(
                              child: Stack(
                            children: <Widget>[
                              Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.network(
                                      "https://image.tmdb.org/t/p/w500${movie.posterPath}")),
                              Positioned(
                                bottom: 10,
                                right: 10,
                                child: Container(
                                  color: Colors.black54,
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    movie.title,
                                    style: const TextStyle(
                                        fontSize: 16.0, color: Colors.white),
                                  ),
                                ),
                              )
                            ],
                          )),
                        );
                      });
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }
                // By default, show a loading spinner.
                return const CircularProgressIndicator();
              }),
        ),
      ),
    );
  }
}
