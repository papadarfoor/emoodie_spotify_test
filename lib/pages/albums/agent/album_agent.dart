import 'package:dio/dio.dart';
import 'package:emoodie_spotify_test/pages/albums/model/album_model.dart';
import 'package:emoodie_spotify_test/setup.dart';

class AlbumAgent {
  Future getAlbums({required String searchText}) async {
    String url = 'https://api.spotify.com/v1/search?q=$searchText&type=album';

    try {
      final response = await dio.get(
        url,
      );

      print(response.data);

      return Album.fromJson(response.data);
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
