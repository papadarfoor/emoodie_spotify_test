import 'package:dio/dio.dart';
import 'package:emoodie_spotify_test/pages/artists/models/artist_model.dart';
import 'package:emoodie_spotify_test/setup.dart';

class ArtistAgent {
  Future getArtists({ required String searchText}) async {
    String url = 'https://api.spotify.com/v1/search?q=$searchText&type=artist';

    try {
      final response = await dio.get(
        url,
       
      );

      // print('Response: ${response.data}');
      if (response.statusCode == 200) {
        final List<dynamic> artistJsonList = response.data['artists']['items'];
        return artistJsonList.map((json) => Artist.fromJson(json)).toList();
      } else {
        print('There was an error');
        return false;
      }
    } on DioException catch (e) {
      if (e.response != null) {
        print('Error1: ${e.response?.data}');
        return e.response?.data['error'];
      } else {
        print('Error2: ${e.message}');
        return false;
      }
    }
  }
}
