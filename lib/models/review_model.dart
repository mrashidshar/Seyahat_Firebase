class Review {
  String id; // Firestore document ID
  String componentId; // Place document ID
  String touristId; // Tourist document ID
  String message;
  int starRating;

  Review({
    required this.id,
    required this.componentId,
    required this.touristId,
    required this.message,
    required this.starRating,
  });

  factory Review.fromJson(Map<String, dynamic> json, String id) {
    return Review(
      id: id,
      componentId: json['component_id'],
      touristId: json['tourist_id'],
      message: json['message'],
      starRating: json['star_rating'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'component_id': componentId,
      'tourist_id': touristId,
      'message': message,
      'star_rating': starRating,
    };
  }
}
