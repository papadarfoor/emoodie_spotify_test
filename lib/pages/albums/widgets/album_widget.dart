import 'package:cached_network_image/cached_network_image.dart';
import 'package:emoodie_spotify_test/constants.dart';
import 'package:emoodie_spotify_test/pages/albums/model/album_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AlbumWidget extends ConsumerStatefulWidget {
  final AlbumElement album;
  const AlbumWidget({super.key, required this.album});

  @override
  ConsumerState<AlbumWidget> createState() => _AlbumWidgetState();
}

class _AlbumWidgetState extends ConsumerState<AlbumWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CachedNetworkImage(
          imageUrl: widget.album.images[0].url,
          fit: BoxFit.cover,
        ),
        Text(
          widget.album.name,
          maxLines: 1,
          style: const TextStyle(fontWeight: FontWeight.bold, color: kWhite),
        ),
        Text(
          widget.album.artists.map((artist) => artist.name).join(', '),
          style: const TextStyle(color: Color.fromARGB(185, 255, 255, 255)),
          maxLines: 1,
        ),
        Text(
          widget.album.albumType == 'album'
              ? widget.album.releaseDate.split('-')[0]
              : '${widget.album.albumType} • ${widget.album.releaseDate.split('-')[0]}',
          maxLines: 1,
          style: const TextStyle(color: Color.fromARGB(185, 255, 255, 255)),
        ),
      ],
    );
  }
}
