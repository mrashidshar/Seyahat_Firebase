class Payment {
  String id; // Firestore document ID
  String tripId; // Trip document ID
  double amount;
  String status; // Payment status

  Payment({
    required this.id,
    required this.tripId,
    required this.amount,
    required this.status,
  });

  factory Payment.fromJson(Map<String, dynamic> json, String id) {
    return Payment(
      id: id,
      tripId: json['trip_id'],
      amount: json['amount'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'trip_id': tripId,
      'amount': amount,
      'status': status,
    };
  }
}
