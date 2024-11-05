class Trip {
  String id; // Firestore document ID
  String guideId; // LocalGuide document ID
  String proposalId; // TripProposal document ID

  Trip({
    required this.id,
    required this.guideId,
    required this.proposalId,
  });

  factory Trip.fromJson(Map<String, dynamic> json, String id) {
    return Trip(
      id: id,
      guideId: json['guide_id'],
      proposalId: json['proposal_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'guide_id': guideId,
      'proposal_id': proposalId,
    };
  }
}
