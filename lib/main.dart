import 'package:flutter/material.dart';
import 'RemoteSource.dart';
import 'package:http/http.dart' as http;

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

class _MyAppState extends State<MyApp>{

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
          child: FutureBuilder<MovieResponse>(future: futureMovie,
              builder: (context ,snapshot){
            if(snapshot.hasData){
              return Text(snapshot.data!.listOfMovies[0].title);
            } else if(snapshot.hasError){
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