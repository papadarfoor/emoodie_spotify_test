import 'package:emoodie_spotify_test/global_models/token_response.dart';

class TokenState {
  final String error;
  final bool isLoading;
  final TokenResponse? token;

  // Constructor for the TokenState
  const TokenState({
    required this.error,
    required this.isLoading,
    required this.token,
  });

  // Initial state (no token, not loading)
  const TokenState.initial({
    this.isLoading = false,
    this.error = "",
    this.token, 
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TokenState &&
          runtimeType == other.runtimeType &&
          error == other.error &&
          isLoading == other.isLoading &&
          token == other.token); 

  @override
  int get hashCode =>
      error.hashCode ^
      isLoading.hashCode ^
      token.hashCode; 

  @override
  String toString() {
    return 'TokenState{error: $error, isLoading: $isLoading, token: $token}';
  }

  // Copy with method to update specific properties
  TokenState copyWith({
    dynamic error,
    bool? isLoading,
    TokenResponse? token,
  }) {
    return TokenState(
      error: error ?? this.error,
      isLoading: isLoading ?? this.isLoading,
      token: token ?? this.token, 
    );
  }

  // Convert to map for serialization or saving
  Map<String, dynamic> toMap() {
    return {
      'error': error,
      'isLoading': isLoading,
      'token': token, 
    };
  }

  // Convert from map for deserialization
  factory TokenState.fromMap(Map<String, dynamic> map) {
    return TokenState(
      error: map['error'],
      isLoading: map['isLoading'] as bool,
      token: map['token'] as TokenResponse, 
    );
  }
}
