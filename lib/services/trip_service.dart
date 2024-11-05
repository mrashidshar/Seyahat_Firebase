import 'package:seyahat/models/trip_model.dart';
import 'firestore_service.dart';

class TripService {
  final FirestoreService _firestoreService = FirestoreService();
  final String collectionPath = 'trips'; // Firestore collection name

  Future<void> addTrip(Trip trip) async {
    await _firestoreService.addDocument(collectionPath, trip.toJson());
  }

  Future<List<Trip>> getTrips() async {
    final docs = await _firestoreService.getCollection(collectionPath);
    return docs.map((doc) => Trip.fromJson(doc.data() as Map<String, dynamic>, doc.id)).toList();
  }

  Future<Trip> getTrip(String id) async {
    final doc = await _firestoreService.getDocument(collectionPath, id);
    return Trip.fromJson(doc.data() as Map<String, dynamic>, doc.id);
  }

  Future<void> updateTrip(Trip trip) async {
    await _firestoreService.updateDocument(collectionPath, trip.id, trip.toJson());
  }

  Future<void> deleteTrip(String id) async {
    await _firestoreService.deleteDocument(collectionPath, id);
  }
}
