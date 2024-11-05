class Tourist {
  String id; // Firestore document ID
  String userId; // User document ID
  String nationality;
  List<String> languages;

  Tourist({
    required this.id,
    required this.userId,
    required this.nationality,
    required this.languages,
  });

  factory Tourist.fromJson(Map<String, dynamic> json, String id) {
    return Tourist(
      id: id,
      userId: json['user_id'],
      nationality: json['nationality'],
      languages: List<String>.from(json['languages'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'nationality': nationality,
      'languages': languages,
    };
  }
}
