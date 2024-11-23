import 'package:emoodie_spotify_test/pages/albums/agent/album_agent.dart';
import 'package:emoodie_spotify_test/pages/artists/agent/artist_agent.dart';
import 'package:emoodie_spotify_test/pages/search/provider/search_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchNotifier extends StateNotifier<SearchState> {
  final Ref ref;

  SearchNotifier(this.ref) : super(const SearchState.initial());

  onSearchTextChanged(String value) {
    state = state.copyWith(searchText: value);
  }

  searchAlbums() async {
    if (state.searchText != null && state.searchText!.isNotEmpty) {
      // Filter albums by name (assuming AlbumElement has a `name` field)

      var result = await AlbumAgent().getAlbums(searchText: state.searchText!);

      // Delay the state update to the next frame
      Future.delayed(Duration.zero, () {
        state = state.copyWith(isLoading: false, albums: result);
      });
    } else {
      // No search query, just return all albums
      Future.delayed(Duration.zero, () {
        state = state.copyWith(isLoading: false, albums: null);
      });
    }
  }

  searchArtists() async {


    if (state.searchText != null && state.searchText!.isNotEmpty) {
      // Filter artists by name
      var result = await ArtistAgent()
          .getArtists( searchText: state.searchText!);

      // Pass the filtered list (casting to nullable)
      Future.delayed(Duration.zero, () {
        state = state.copyWith(isLoading: false, artists: result);
      });
    } else {
      // No search query, just return all artists
      Future.delayed(Duration.zero, () {
        state = state.copyWith(isLoading: false, artists: null);
      });
    }
  }
}
