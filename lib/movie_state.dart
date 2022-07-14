import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

Future<MovieResponse> fetchMovie(http.Client client) async {
  final response = await client.get(Uri.parse(
      'https://api.themoviedb.org/3/movie/popular?api_key=9986464dc7ff8e83569e65a98dc7b3b6'));

  if (response.statusCode == 200) {
    final jsonResponse = json.decode(response.body);

    try {
      return MovieResponse.fromJson(jsonResponse);
    } catch (exception) {
      rethrow;
    }
  } else {
    throw Exception('failed to load movies');
  }
}

class MovieResponse {
  final List<MovieItem> listOfMovies;

  const MovieResponse({required this.listOfMovies});

  factory MovieResponse.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      try {
        var resultObjJson = json['results'] as List;
        var results =
            resultObjJson.map((data) => MovieItem.fromJson(data)).toList();
        return MovieResponse(listOfMovies: results);
      } catch (exception) {
        rethrow;
      }
    } else {
      throw Exception('failed to load movies');
    }
  }
}

class MovieItem {
  final String title;
  final String posterPath;

  const MovieItem({required this.title, required this.posterPath});

  factory MovieItem.fromJson(Map<String, dynamic> json) {
    if (json['title'] != null && json['poster_path'] != null) {
      return MovieItem(
          title: json['title'] as String,
          posterPath: json['poster_path'] as String);
    } else {
      throw Exception('failed to load movies');
    }
  }
}
