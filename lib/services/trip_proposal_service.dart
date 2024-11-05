import 'package:seyahat/models/trip_proposal_model.dart';
import 'firestore_service.dart';

class TripProposalService {
  final FirestoreService _firestoreService = FirestoreService();
  final String collectionPath = 'tripProposals'; // Firestore collection name

  Future<void> addTripProposal(TripProposal proposal) async {
    await _firestoreService.addDocument(collectionPath, proposal.toJson());
  }

  Future<List<TripProposal>> getTripProposals() async {
    final docs = await _firestoreService.getCollection(collectionPath);
    return docs.map((doc) => TripProposal.fromJson(doc.data() as Map<String, dynamic>, doc.id)).toList();
  }

  Future<TripProposal> getTripProposal(String id) async {
    final doc = await _firestoreService.getDocument(collectionPath, id);
    return TripProposal.fromJson(doc.data() as Map<String, dynamic>, doc.id);
  }

  Future<void> updateTripProposal(TripProposal proposal) async {
    await _firestoreService.updateDocument(collectionPath, proposal.id, proposal.toJson());
  }

  Future<void> deleteTripProposal(String id) async {
    await _firestoreService.deleteDocument(collectionPath, id);
  }
}
