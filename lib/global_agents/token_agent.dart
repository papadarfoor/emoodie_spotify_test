import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:emoodie_spotify_test/constants.dart';
import 'package:emoodie_spotify_test/global_models/token_response.dart';
import 'package:emoodie_spotify_test/setup.dart';

class TokenAgent {

  Future authenticate() async {
    String url = 'https://accounts.spotify.com/api/token';
    String credentials = '$clientID:$clientSecret';
    String base64Credentials = base64Encode(utf8.encode(credentials));

    final data = {
      "grant_type": 'client_credentials',
    };

    try {
      final response = await dio.post(
        url,
        data: data,
        options: Options(
          headers: {
            'Content-Type': 'application/x-www-form-urlencoded',
            'Authorization': 'Basic $base64Credentials'
          },
        ),
      );

      return TokenResponse.fromJson(response.data);
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
