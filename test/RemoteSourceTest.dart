import 'package:first_chapter_flutter/RemoteSource.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'RemoteSourceTest.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  group('fetch list of movies', () {
    test('returns list of movie if http calls complete successfully', () async {
      final client = MockClient();

      when(client.get(Uri.parse(
              'https://api.themoviedb.org/3/movie/popular?api_key=9986464dc7ff8e83569e65a98dc7b3b6')))
          .thenAnswer((_) async => http.Response(dummyResponse, 200));

      expect(await fetchMovie(client), isA<MovieResponse>());
    });

    test('throws exception if fetchMovie is failed', () {
      final client = MockClient();
      when(client.get(Uri.parse(
              'https://api.themoviedb.org/3/movie/popular?api_key=9986464dc7ff8e83569e65a98dc7b3b6')))
          .thenAnswer((_) async => http.Response('Not Found', 404));

      expect(fetchMovie(client), throwsException);
    });

    test('throws exception when results is null', () async {
      final client = MockClient();

      when(client.get(Uri.parse(
              'https://api.themoviedb.org/3/movie/popular?api_key=9986464dc7ff8e83569e65a98dc7b3b6')))
          .thenAnswer((_) async => http.Response(dummyUnknownResponse, 200));

      expect(fetchMovie(client), throwsException);
    });

    test('throws exception when all movie item is null', () async {
      final client = MockClient();

      when(client.get(Uri.parse(
              'https://api.themoviedb.org/3/movie/popular?api_key=9986464dc7ff8e83569e65a98dc7b3b6')))
          .thenAnswer(
              (_) async => http.Response(dummyNullAllItemResponse, 200));

      expect(fetchMovie(client), throwsException);
    });

    test('throws exception when single movie item is null', () async {
      final client = MockClient();

      when(client.get(Uri.parse(
              'https://api.themoviedb.org/3/movie/popular?api_key=9986464dc7ff8e83569e65a98dc7b3b6')))
          .thenAnswer(
              (_) async => http.Response(dummyNullSingleItemResponse, 200));

      expect(fetchMovie(client), throwsException);
    });
  });
}

const dummyResponse =
    "{\"results\":[{\"poster_path\":\"/wKiOkZTN9lUUUNZLmtnwubZYONg.jpg\",\"title\":\"Minions:TheRiseofGru\"}]}";

const dummyUnknownResponse = '{"userId": 1, "id": 2, "title": "mock"}';

const dummyNullAllItemResponse =
    "{\"results\":[{\"poster_path\":null,\"title\":null}]}";

const dummyNullSingleItemResponse =
    "{\"results\":[{\"title\":\"Minions:TheRiseofGru\"}]}";
