import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:emoodie_spotify_test/api/extensions.dart';
import 'package:emoodie_spotify_test/global_agents/token_agent.dart';
import 'package:emoodie_spotify_test/services/token_service.dart';
import 'package:emoodie_spotify_test/setup.dart';

class CustomDioInterceptor extends Interceptor {
  CustomDioInterceptor({
    required TokenService tokenStorageService,
    required Dio dio,
  })  : _dio = dio,
        _tokenStorageService = tokenStorageService;
  final TokenService _tokenStorageService;
  final Dio _dio;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // Check if the Authorization header is not present in the request options
    if (!options.headers.containsKey('Authorization')) {
      // Get the token from storage
      final header = await _tokenStorageService.toHeader();

      // Add the token to the request options if it is not null

      options.headers.addAll(header);
    }

    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // Convert successful responses to ApiData
    handler.resolve(
      Response(
        requestOptions: response.requestOptions,
        data: response.data,
        statusCode: response.statusCode,
        headers: response.headers,
      ),
    );
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    if (err.isTokenExpiry) {
 
      final result = await TokenAgent().authenticate();
      if (result is String || result == false) {
        await tokenService.deleteToken();
        handler.reject(
          DioException(
            requestOptions: err.requestOptions,
            error: result is String
                ? result
                : "An error occurred while refreshing your token",
          ),
        );
      }
      await tokenService.setToken(result.accessToken);
      final newTokenHeader = await tokenService.toHeader();
      // Retry the original request with the new token
      final opts = err.requestOptions;
      opts.headers.addAll(newTokenHeader);

      try {
        final response = await _dio.fetch(opts);
        return handler.resolve(response);
      } on DioException catch (retryError) {
        return handler.reject(retryError);
      }
    }

    log(err.toString(), stackTrace: err.stackTrace);
    handler.resolve(
      Response(
        requestOptions: err.requestOptions,
        data: err.response?.data,
        statusCode: err.response?.statusCode,
      ),
    );
  }
}
