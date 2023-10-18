class MovieModel {
  final String id;
  final String name;
  final String directorName;
  String? posterUrl;

  MovieModel({
    required this.id,
    required this.name,
    required this.directorName,
    required this.posterUrl,
  });

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "director_name": directorName,
      "poster_url": posterUrl,
    };
  }

  factory MovieModel.fromJson(Map<String, dynamic> map) {
    return MovieModel(
      id: map['id'],
      name: map['name'],
      directorName: map['director_name'],
      posterUrl: map['poster_url'],
    );
  }
}
