import 'package:cloud_firestore/cloud_firestore.dart';

class TripProposal {
  String id; // Firestore document ID
  DateTime startTime; // Start time of the trip
  DateTime endTime; // End time of the trip
  String touristId; // Tourist document ID
  String destination; // Reference to Place document ID
  String status; // Proposal status

  TripProposal({
    required this.id,
    required this.startTime,
    required this.endTime,
    required this.touristId,
    required this.destination,
    required this.status,
  });

  factory TripProposal.fromJson(Map<String, dynamic> json, String id) {
    return TripProposal(
      id: id,
      startTime: (json['start_time'] as Timestamp).toDate(),
      endTime: (json['end_time'] as Timestamp).toDate(),
      touristId: json['tourist_id'],
      destination: json['destination'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'start_time': startTime,
      'end_time': endTime,
      'tourist_id': touristId,
      'destination': destination,
      'status': status,
    };
  }
}
