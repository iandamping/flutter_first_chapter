import 'package:first_chapter_flutter/detail_movie_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'detail_movie_state_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  const dummyDetailResponse =
      "{\"id\":438148,\"overview\":\"A fanboy of a supervillain supergroup known as the Vicious 6, Gru hatches a plan to become evil enough to join them, with the backup of his followers, the Minions.\",\"poster_path\":\"/wKiOkZTN9lUUUNZLmtnwubZYONg.jpg\",\"title\":\"Minions:TheRiseofGru\"}";

  const dummyDetailUnknownResponse = '{"userId": 1, "id": 2, "title": "mock"}';

  const dummyDetailNullAllItemResponse =
      "{\"id\":null,\"overview\":null,\"poster_path\":null,\"title\":null}";

  const dummyDetailNullSingleItemResponse =
      "{\"id\":null,\"overview\":\"A fanboy of a supervillain supergroup known as the Vicious 6, Gru hatches a plan to become evil enough to join them, with the backup of his followers, the Minions.\",\"poster_path\":\"/wKiOkZTN9lUUUNZLmtnwubZYONg.jpg\",\"title\":\"Minions:TheRiseofGru\"}";

  const int dummyId = 2334;

  group('fetch detail movies', () {

    test('returns detail movie if http calls complete successfully', () async {
      final client = MockClient();

      when(client.get(Uri.parse(
          'https://api.themoviedb.org/3/movie/$dummyId?api_key=9986464dc7ff8e83569e65a98dc7b3b6')))
          .thenAnswer((_) async => http.Response(dummyDetailResponse, 200));

      expect(await fetchDetailMovie(client, dummyId), isA<DetailMovieItem>());
    });

    test('throws exception if fetchMovie is failed', () {
      final client = MockClient();
      when(client.get(Uri.parse(
          'https://api.themoviedb.org/3/movie/$dummyId?api_key=9986464dc7ff8e83569e65a98dc7b3b6')))
          .thenAnswer((_) async => http.Response('Not Found', 404));

      expect(fetchDetailMovie(client, dummyId), throwsException);
    });

    test('throws exception when got different result', () async {
      final client = MockClient();

      when(client.get(Uri.parse(
          'https://api.themoviedb.org/3/movie/$dummyId?api_key=9986464dc7ff8e83569e65a98dc7b3b6')))
          .thenAnswer((_) async => http.Response(dummyDetailUnknownResponse, 200));

      expect(fetchDetailMovie(client, dummyId), throwsException);
    });

    test('throws exception when all detail movie item is null', () async {
      final client = MockClient();

      when(client.get(Uri.parse(
          'https://api.themoviedb.org/3/movie/$dummyId?api_key=9986464dc7ff8e83569e65a98dc7b3b6')))
          .thenAnswer(
              (_) async => http.Response(dummyDetailNullAllItemResponse, 200));

      expect(fetchDetailMovie(client, dummyId), throwsException);
    });

    test('throws exception when single movie item is null', () async {
      final client = MockClient();

      when(client.get(Uri.parse(
          'https://api.themoviedb.org/3/movie/$dummyId?api_key=9986464dc7ff8e83569e65a98dc7b3b6')))
          .thenAnswer(
              (_) async => http.Response(dummyDetailNullSingleItemResponse, 200));

      expect(fetchDetailMovie(client, dummyId), throwsException);
    });


  });
}
