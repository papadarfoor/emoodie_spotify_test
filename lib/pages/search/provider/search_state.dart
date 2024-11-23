import 'package:emoodie_spotify_test/pages/albums/model/album_model.dart';
import 'package:emoodie_spotify_test/pages/artists/models/artist_model.dart';

class SearchState {
  final dynamic error;
  final bool isLoading;
  final String? searchText;
  final Album? albums;
  final List<Artist>? artists;

  // Constructor for the SearchState
  const SearchState({
    required this.error,
    required this.isLoading,
    required this.searchText,
    this.albums,
    this.artists,
  });

  // Initial state (no searchText, not loading, no albums)
  const SearchState.initial({
    this.isLoading = false,
    this.error,
    this.searchText,
    this.albums,
    this.artists,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SearchState &&
          runtimeType == other.runtimeType &&
          error == other.error &&
          isLoading == other.isLoading &&
          searchText == other.searchText &&
          albums == other.albums &&
          artists == other.artists);

  @override
  int get hashCode =>
      error.hashCode ^
      isLoading.hashCode ^
      searchText.hashCode ^
      albums.hashCode ^
      artists.hashCode;

  @override
  String toString() {
    return 'SearchState{error: $error, isLoading: $isLoading, searchText: $searchText, albums: $albums , artists: $artists}';
  }

  // Copy with method to update specific properties
  SearchState copyWith({
    dynamic error,
    bool? isLoading,
    String? searchText,
    Album? albums,
    List<Artist>? artists,
  }) {
    return SearchState(
        error: error ?? this.error,
        isLoading: isLoading ?? this.isLoading,
        searchText: searchText ?? this.searchText,
        albums: albums ?? this.albums,
        artists: artists ?? this.artists);
  }

  // Convert to map for serialization or saving
  Map<String, dynamic> toMap() {
    return {
      'error': error,
      'isLoading': isLoading,
      'searchText': searchText,
      'albums': albums,
      'artists': artists
    };
  }

  // Convert from map for deserialization
  factory SearchState.fromMap(Map<String, dynamic> map) {
    return SearchState(
      error: map['error'],
      isLoading: map['isLoading'] as bool,
      searchText: map['searchText'] as String?,
      albums: map['albums'] as Album?,
      artists: map['artist'] as List<Artist>?,
    );
  }
}
