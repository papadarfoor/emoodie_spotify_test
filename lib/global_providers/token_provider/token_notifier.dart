import 'package:emoodie_spotify_test/global_agents/token_agent.dart';
import 'package:emoodie_spotify_test/global_providers/token_provider/token_state.dart';
import 'package:emoodie_spotify_test/services/token_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TokenNotifier extends StateNotifier<TokenState> {
  final Ref ref;
  final TokenService tokenService;

  TokenNotifier(this.ref, this.tokenService) : super(const TokenState.initial()){
    authenticate();
  }

  authenticate() async {
    state = state.copyWith(isLoading: true);

    var result = await TokenAgent().authenticate();

    if (result is String) {
      state = state.copyWith(isLoading: false, error: result);

      return;
    }

    if (result is bool && !result) {
      state = state.copyWith(isLoading: false, error: "An error occured.");

      return;
    }

    await tokenService.setToken(result.accessToken);

    state = state.copyWith(isLoading: false, token: result);

    return;
  }
}
