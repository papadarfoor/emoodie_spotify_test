class Album {
  List<AlbumElement> albums;

  Album({required this.albums});

  Album copyWith({List<AlbumElement>? albums}) {
    return Album(albums: albums ?? this.albums);
  }

  factory Album.fromJson(Map<String, dynamic> json) {
    List albums = json['albums']['items'];

    return Album(
      albums: (albums)
          .where((albumJson) => albumJson != null) // Filter out null elements
          .map((albumJson) => AlbumElement.fromJson(albumJson))
          .toList(),
    );
  }
}

class AlbumElement {
  String albumType;
  int totalTracks;
  List<String> availableMarkets;
  ExternalUrls externalUrls;
  String href;
  String id;
  List<Image> images;
  String name;
  String releaseDate;
  String releaseDatePrecision;
  String type;
  String uri;
  List<AlbumArtist> artists;

  AlbumElement({
    required this.albumType,
    required this.totalTracks,
    required this.availableMarkets,
    required this.externalUrls,
    required this.href,
    required this.id,
    required this.images,
    required this.name,
    required this.releaseDate,
    required this.releaseDatePrecision,
    required this.type,
    required this.uri,
    required this.artists,
  });

  AlbumElement copyWith({
    String? albumType,
    int? totalTracks,
    List<String>? availableMarkets,
    ExternalUrls? externalUrls,
    String? href,
    String? id,
    List<Image>? images,
    String? name,
    String? releaseDate,
    String? releaseDatePrecision,
    String? type,
    String? uri,
    List<AlbumArtist>? artists,
  }) {
    return AlbumElement(
      albumType: albumType ?? this.albumType,
      totalTracks: totalTracks ?? this.totalTracks,
      availableMarkets: availableMarkets ?? this.availableMarkets,
      externalUrls: externalUrls ?? this.externalUrls,
      href: href ?? this.href,
      id: id ?? this.id,
      images: images ?? this.images,
      name: name ?? this.name,
      releaseDate: releaseDate ?? this.releaseDate,
      releaseDatePrecision: releaseDatePrecision ?? this.releaseDatePrecision,
      type: type ?? this.type,
      uri: uri ?? this.uri,
      artists: artists ?? this.artists,
    );
  }

  factory AlbumElement.fromJson(Map<String, dynamic> json) {
    return AlbumElement(
      albumType: json['album_type'],
      totalTracks: json['total_tracks'],
      availableMarkets: List<String>.from(json['available_markets']),
      externalUrls: ExternalUrls.fromJson(json['external_urls']),
      href: json['href'],
      id: json['id'],
      images: List<Image>.from(json['images'].map((x) => Image.fromJson(x))),
      name: json['name'],
      releaseDate: json['release_date'],
      releaseDatePrecision: json['release_date_precision'],
      type: json['type'],
      uri: json['uri'],
      artists: List<AlbumArtist>.from(
          json['artists'].map((x) => AlbumArtist.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'albumType': albumType,
      'totalTracks': totalTracks,
      'availableMarkets': availableMarkets,
      'externalUrls': externalUrls.toJson(),
      'href': href,
      'id': id,
      'images': images.map((x) => x.toJson()).toList(),
      'name': name,
      'releaseDate': releaseDate,
      'releaseDatePrecision': releaseDatePrecision,
      'type': type,
      'uri': uri,
      'artists': artists.map((x) => x.toJson()).toList(),
    };
  }
}

class AlbumArtist {
  ExternalUrls externalUrls;
  String href;
  String id;
  String? name;
  String type;
  String uri;

  AlbumArtist({
    required this.externalUrls,
    required this.href,
    required this.id,
    this.name,
    required this.type,
    required this.uri,
  });

  AlbumArtist copyWith({
    ExternalUrls? externalUrls,
    String? href,
    String? id,
    String? name,
    String? type,
    String? uri,
  }) {
    return AlbumArtist(
      externalUrls: externalUrls ?? this.externalUrls,
      href: href ?? this.href,
      id: id ?? this.id,
      name: name ?? this.name,
      type: type ?? this.type,
      uri: uri ?? this.uri,
    );
  }

  factory AlbumArtist.fromJson(Map<String, dynamic> json) {
    return AlbumArtist(
      externalUrls: ExternalUrls.fromJson(json['external_urls']),
      href: json['href'],
      id: json['id'],
      name: json['name'],
      type: json['type'],
      uri: json['uri'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'externalUrls': externalUrls.toJson(),
      'href': href,
      'id': id,
      'name': name,
      'type': type,
      'uri': uri,
    };
  }
}

class ExternalUrls {
  String spotify;

  ExternalUrls({required this.spotify});

  ExternalUrls copyWith({String? spotify}) {
    return ExternalUrls(spotify: spotify ?? this.spotify);
  }

  factory ExternalUrls.fromJson(Map<String, dynamic> json) {
    return ExternalUrls(spotify: json['spotify']);
  }

  Map<String, dynamic> toJson() {
    return {'spotify': spotify};
  }
}

class ExternalIds {
  String upc;

  ExternalIds({required this.upc});

  ExternalIds copyWith({String? upc}) {
    return ExternalIds(upc: upc ?? this.upc);
  }

  factory ExternalIds.fromJson(Map<String, dynamic> json) {
    return ExternalIds(upc: json['upc']);
  }

  Map<String, dynamic> toJson() {
    return {'upc': upc};
  }
}

class Image {
  String url;
  int height;
  int width;

  Image({required this.url, required this.height, required this.width});

  Image copyWith({String? url, int? height, int? width}) {
    return Image(
      url: url ?? this.url,
      height: height ?? this.height,
      width: width ?? this.width,
    );
  }

  factory Image.fromJson(Map<String, dynamic> json) {
    return Image(
      url: json['url'],
      height: json['height'],
      width: json['width'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'url': url,
      'height': height,
      'width': width,
    };
  }
}

class Tracks {
  String href;
  int limit;
  dynamic next;
  int offset;
  dynamic previous;
  int total;
  List<Item> items;

  Tracks({
    required this.href,
    required this.limit,
    required this.next,
    required this.offset,
    required this.previous,
    required this.total,
    required this.items,
  });

  Tracks copyWith({
    String? href,
    int? limit,
    dynamic next,
    int? offset,
    dynamic previous,
    int? total,
    List<Item>? items,
  }) {
    return Tracks(
      href: href ?? this.href,
      limit: limit ?? this.limit,
      next: next ?? this.next,
      offset: offset ?? this.offset,
      previous: previous ?? this.previous,
      total: total ?? this.total,
      items: items ?? this.items,
    );
  }

  factory Tracks.fromJson(Map<String, dynamic> json) {
    return Tracks(
      href: json['href'],
      limit: json['limit'],
      next: json['next'],
      offset: json['offset'],
      previous: json['previous'],
      total: json['total'],
      items: List<Item>.from(json['items'].map((x) => Item.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'href': href,
      'limit': limit,
      'next': next,
      'offset': offset,
      'previous': previous,
      'total': total,
      'items': items,
    };
  }
}

class Item {
  List<AlbumArtist> artists;
  List<String> availableMarkets;
  int discNumber;
  int durationMs;
  bool explicit;
  ExternalUrls externalUrls;
  String href;
  String id;
  String name;
  String? previewUrl;
  int trackNumber;
  String type;
  String uri;
  bool isLocal;
  AlbumArtist? linkedFrom;

  Item({
    required this.artists,
    required this.availableMarkets,
    required this.discNumber,
    required this.durationMs,
    required this.explicit,
    required this.externalUrls,
    required this.href,
    required this.id,
    required this.name,
    this.previewUrl,
    required this.trackNumber,
    required this.type,
    required this.uri,
    required this.isLocal,
    this.linkedFrom,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      artists: List<AlbumArtist>.from(
          json['artists'].map((x) => AlbumArtist.fromJson(x))),
      availableMarkets: List<String>.from(json['available_markets']),
      discNumber: json['disc_number'],
      durationMs: json['duration_ms'],
      explicit: json['explicit'],
      externalUrls: ExternalUrls.fromJson(json['external_urls']),
      href: json['href'],
      id: json['id'],
      name: json['name'],
      previewUrl: json['preview_url'],
      trackNumber: json['track_number'],
      type: json['type'],
      uri: json['uri'],
      isLocal: json['is_local'],
      linkedFrom: json['linked_from'] != null
          ? AlbumArtist.fromJson(json['linked_from'])
          : null,
    );
  }
}
