import 'package:emoodie_spotify_test/pages/artists/models/artist_model.dart';
import 'package:emoodie_spotify_test/pages/artists/widgets/artist_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ArtistsScreen extends ConsumerStatefulWidget {
  final List<Artist>? artists;
  const ArtistsScreen({super.key, this.artists});

  @override
  ConsumerState<ArtistsScreen> createState() => _ArtistsScreenState();
}

class _ArtistsScreenState extends ConsumerState<ArtistsScreen> {
  @override
  Widget build(BuildContext context) {
    if (widget.artists == null || widget.artists!.isEmpty) {
      return const SizedBox.shrink();
    }

    return ArtistListWidget(artists: widget.artists!);
  }
}
