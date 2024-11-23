import 'package:emoodie_spotify_test/pages/albums/widgets/album_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:emoodie_spotify_test/pages/albums/model/album_model.dart';

class AlbumsScreen extends ConsumerStatefulWidget {
  final Album? albums;
  const AlbumsScreen({super.key, this.albums});

  @override
  ConsumerState<AlbumsScreen> createState() => _AlbumsScreenState();
}

class _AlbumsScreenState extends ConsumerState<AlbumsScreen> {
  @override
  Widget build(BuildContext context) {
    if (widget.albums == null || widget.albums!.albums.isEmpty) {
      return const SizedBox.shrink();
    }

    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 30,
        childAspectRatio: 0.7,
      ),
      itemCount: widget.albums!.albums.length,
      itemBuilder: (context, index) {
        return AlbumWidget(album: widget.albums!.albums[index]);
      },
    );
  }
}
