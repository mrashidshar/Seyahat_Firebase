class LocalGuide {
  String id; // Firestore document ID
  String userId; // User document ID
  bool isOnline;
  bool isBooked;
  int starRating;
  List<String> languages;

  LocalGuide({
    required this.id,
    required this.userId,
    required this.isOnline,
    required this.isBooked,
    required this.starRating,
    required this.languages,
  });

  factory LocalGuide.fromJson(Map<String, dynamic> json, String id) {
    return LocalGuide(
      id: id,
      userId: json['user_id'],
      isOnline: json['isOnline'],
      isBooked: json['isBooked'],
      starRating: json['star_rating'],
      languages: List<String>.from(json['languages'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'isOnline': isOnline,
      'isBooked': isBooked,
      'star_rating': starRating,
      'languages': languages,
    };
  }
}
