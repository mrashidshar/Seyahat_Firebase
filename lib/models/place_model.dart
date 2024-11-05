class Place {
  String id; // Firestore document ID
  String name;
  double longitude;
  double latitude;
  String description;
  List<String> gallery; // List of image URLs
  int starRating;
  String thumbnail;

  Place({
    required this.id,
    required this.name,
    required this.longitude,
    required this.latitude,
    required this.description,
    required this.gallery,
    required this.starRating,
    required this.thumbnail,
  });

  factory Place.fromJson(Map<String, dynamic> json, String id) {
    return Place(
      id: id,
      name: json['name'],
      longitude: json['longitude'],
      latitude: json['latitude'],
      description: json['description'],
      gallery: List<String>.from(json['gallery'] ?? []),
      starRating: json['star_rating'],
      thumbnail: json['thumbnail'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'longitude': longitude,
      'latitude': latitude,
      'description': description,
      'gallery': gallery,
      'star_rating': starRating,
      'thumbnail': thumbnail,
    };
  }
}
