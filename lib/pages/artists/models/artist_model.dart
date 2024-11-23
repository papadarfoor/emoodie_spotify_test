class Artist {
  ExternalUrls externalUrls;
  Followers followers;
  List<String> genres;
  String href;
  String id;
  List<Image> images;
  String? name;
  int popularity;
  String type;
  String uri;

  Artist({
    required this.externalUrls,
    required this.followers,
    required this.genres,
    required this.href,
    required this.id,
    required this.images,
    this.name,
    required this.popularity,
    required this.type,
    required this.uri,
  });

  Artist copyWith({
    ExternalUrls? externalUrls,
    Followers? followers,
    List<String>? genres,
    String? href,
    String? id,
    List<Image>? images,
    String? name,
    int? popularity,
    String? type,
    String? uri,
  }) {
    return Artist(
      externalUrls: externalUrls ?? this.externalUrls,
      followers: followers ?? this.followers,
      genres: genres ?? this.genres,
      href: href ?? this.href,
      id: id ?? this.id,
      images: images ?? this.images,
      name: name ?? this.name,
      popularity: popularity ?? this.popularity,
      type: type ?? this.type,
      uri: uri ?? this.uri,
    );
  }

  factory Artist.fromJson(Map<String, dynamic> json) {
    return Artist(
      externalUrls: ExternalUrls.fromJson(json['external_urls']),
      followers: Followers.fromJson(json['followers']),
      genres: List<String>.from(json['genres']),
      href: json['href'],
      id: json['id'],
      images: List<Image>.from(json['images'].map((x) => Image.fromJson(x))),
      name: json['name'],
      popularity: json['popularity'],
      type: json['type'],
      uri: json['uri'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'external_urls': externalUrls.toJson(),
      'followers': followers.toJson(),
      'genres': genres,
      'href': href,
      'id': id,
      'images': images.map((x) => x.toJson()).toList(),
      'name': name,
      'popularity': popularity,
      'type': type,
      'uri': uri,
    };
  }
}

class ExternalUrls {
  String spotify;

  ExternalUrls({required this.spotify});

  factory ExternalUrls.fromJson(Map<String, dynamic> json) {
    return ExternalUrls(
      spotify: json['spotify'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'spotify': spotify,
    };
  }
}

class Followers {
  String? href;
  int total;

  Followers({this.href, required this.total});

  factory Followers.fromJson(Map<String, dynamic> json) {
    return Followers(
      href: json['href'],
      total: json['total'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'href': href,
      'total': total,
    };
  }
}

class Image {
  String url;
  int height;
  int width;

  Image({required this.url, required this.height, required this.width});

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
