import 'package:emoodie_spotify_test/constants.dart';
import 'package:emoodie_spotify_test/global_widgets/custom_search_bar.dart';
import 'package:emoodie_spotify_test/global_widgets/toggle_botton.dart';
import 'package:emoodie_spotify_test/pages/albums/albums.dart';
import 'package:emoodie_spotify_test/pages/albums/model/album_model.dart';
import 'package:emoodie_spotify_test/pages/artists/artist.dart';
import 'package:emoodie_spotify_test/pages/artists/models/artist_model.dart';
import 'package:emoodie_spotify_test/pages/search/provider/search_notifier.dart';
import 'package:emoodie_spotify_test/pages/search/provider/search_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_debouncer/flutter_debouncer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final searchProvider =
    StateNotifierProvider<SearchNotifier, SearchState>((ref) {
  return SearchNotifier(ref);
});

final Debouncer _debouncer = Debouncer();

class SearchPage extends ConsumerStatefulWidget {
  const SearchPage({super.key});

  @override
  ConsumerState<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends ConsumerState<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlack,
      body: SafeArea(
          child: Padding(
        padding: kPadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              searchText,
              style: TextStyle(
                  color: kWhite, fontWeight: FontWeight.bold, fontSize: 32),
            ),
            const SizedBox(
              height: 20,
            ),
            CustomSearchBar(
                hintText: searchBarHintText,
                onSearch: (value) {
                  const duration = Duration(milliseconds: 500);
                  _debouncer.debounce(
                    duration: duration,
                    onDebounce: () async {
                      await ref.read(searchProvider.notifier).onSearchTextChanged(value);
                      await ref.read(searchProvider.notifier).searchAlbums();
                      await ref.read(searchProvider.notifier).searchArtists();
                    },
                  );
                }),
            Consumer(builder: (context, ref, child) {
              String? searchText = ref.watch(searchProvider).searchText;
              return Visibility(
                  visible: searchText == null || searchText == "",
                  replacement: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: ToggleButton(),
                  ),
                  child: const SizedBox.shrink());
            }),
            Consumer(
              builder: (context, ref, child) {
                int toggleIndex = ref.watch(selectedButtonProvider);
                Album? albums = ref.watch(searchProvider).albums;
                List<Artist>? artists = ref.watch(searchProvider).artists;
                String? searchText = ref.watch(searchProvider).searchText;

                if (searchText == null || searchText == "") {
                  return const SizedBox.shrink();
                }

                return Visibility(
                    visible: toggleIndex == 0,
                    replacement: Expanded(
                      child: ArtistsScreen(
                        artists: artists,
                      ),
                    ),
                    child: Expanded(
                      child: AlbumsScreen(
                        albums: albums,
                      ),
                    ));
              },
            )
          ],
        ),
      )),
    );
  }
}
