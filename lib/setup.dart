import 'package:dio/dio.dart';
import 'package:emoodie_spotify_test/api/interceptor.dart';
import 'package:emoodie_spotify_test/global_providers/token_provider/token_notifier.dart';
import 'package:emoodie_spotify_test/global_providers/token_provider/token_state.dart';
import 'package:emoodie_spotify_test/services/token_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dio = Dio();

final tokenService = TokenService();

final tokenProvider = StateNotifierProvider<TokenNotifier, TokenState>((ref) {
  return TokenNotifier(ref, tokenService);
});


Future<void> setup() async {
  dio.interceptors.add(CustomDioInterceptor(
    tokenStorageService: tokenService,
    dio: dio
  ));
}
