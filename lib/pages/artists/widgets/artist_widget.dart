import 'package:cached_network_image/cached_network_image.dart';
import 'package:emoodie_spotify_test/constants.dart';
import 'package:emoodie_spotify_test/pages/artists/models/artist_model.dart';
import 'package:flutter/material.dart';

class ArtistListWidget extends StatelessWidget {
  final List<Artist> artists;

  const ArtistListWidget({super.key, required this.artists});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: artists.length,
      itemBuilder: (context, index) {
        final artist = artists[index];
        final imageUrl = (artist.images.isNotEmpty)
            ? artist.images[0].url
            : 'https://i.ibb.co/P9pX4PN/Screenshot-2024-11-23-at-7-56-24-PM.png';
        return ListTile(
          leading: CircleAvatar(
            backgroundImage: CachedNetworkImageProvider(imageUrl),
            radius: 20,
          ),
          title: Text(
            artist.name ?? "",
            style: const TextStyle(
              color: kWhite,
              fontSize: 16,
            ),
          ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
        );
      },
    );
  }
}
