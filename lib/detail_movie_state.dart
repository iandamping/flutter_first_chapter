import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

Future<DetailMovieItem> fetchDetailMovie(
    http.Client client, int movieId) async {
  final response = await client.get(Uri.parse(
      'https://api.themoviedb.org/3/movie/$movieId?api_key=9986464dc7ff8e83569e65a98dc7b3b6'));

  if (response.statusCode == 200) {
    final jsonResponse = json.decode(response.body);

    try {
      return DetailMovieItem.fromJson(jsonResponse);
    } catch (exception) {
      rethrow;
    }
  } else {
    throw Exception('failed to load movies');
  }
}

class DetailMovieItem {
  final int movieId;
  final String title;
  final String posterPath;
  final String overview;

  DetailMovieItem(
      {required this.movieId,
      required this.title,
      required this.posterPath,
      required this.overview});

  factory DetailMovieItem.fromJson(Map<String, dynamic> json) {
    if (json["id"] != null &&
        json['title'] != null &&
        json['poster_path'] != null &&
        json['overview'] != null) {
      return DetailMovieItem(
          movieId: json['id'],
          title: json['title'],
          posterPath: json['poster_path'],
          overview: json['overview']);
    } else {
      throw Exception('failed to load detail movies');
    }
  }
}
