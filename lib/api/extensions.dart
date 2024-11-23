import 'package:dio/dio.dart';

extension DioExceptionsExtension on DioException {
  bool get isTokenExpiry {
    return response?.statusCode == 401 &&
        response?.data is Map<String, dynamic> &&
        ((response!.data as Map<String, dynamic>)['error']['message'] ==
            'The access token expired');
  }
}
