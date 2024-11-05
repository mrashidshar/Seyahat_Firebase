import 'package:seyahat/models/place_model.dart';
import 'firestore_service.dart';

class PlaceService {
  final FirestoreService _firestoreService = FirestoreService();
  final String collectionPath = 'places'; // Firestore collection name

  Future<void> addPlace(Place place) async {
    await _firestoreService.addDocument(collectionPath, place.toJson());
  }

  Future<List<Place>> getPlaces() async {
    final docs = await _firestoreService.getCollection(collectionPath);
    return docs.map((doc) => Place.fromJson(doc.data() as Map<String, dynamic>, doc.id)).toList();
  }

  Future<Place> getPlace(String id) async {
    final doc = await _firestoreService.getDocument(collectionPath, id);
    return Place.fromJson(doc.data() as Map<String, dynamic>, doc.id);
  }

  Future<void> updatePlace(Place place) async {
    await _firestoreService.updateDocument(collectionPath, place.id, place.toJson());
  }

  Future<void> deletePlace(String id) async {
    await _firestoreService.deleteDocument(collectionPath, id);
  }
}
