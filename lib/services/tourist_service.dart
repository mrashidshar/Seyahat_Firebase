import 'package:seyahat/models/tourist_model.dart';
import 'firestore_service.dart';

class TouristService {
  final FirestoreService _firestoreService = FirestoreService();
  final String collectionPath = 'tourists'; // Firestore collection name

  Future<void> addTourist(Tourist tourist) async {
    await _firestoreService.addDocument(collectionPath, tourist.toJson());
  }

  Future<List<Tourist>> getTourists() async {
    final docs = await _firestoreService.getCollection(collectionPath);
    return docs.map((doc) => Tourist.fromJson(doc.data() as Map<String, dynamic>, doc.id)).toList();
  }

  Future<Tourist> getTourist(String id) async {
    final doc = await _firestoreService.getDocument(collectionPath, id);
    return Tourist.fromJson(doc.data() as Map<String, dynamic>, doc.id);
  }

  Future<void> updateTourist(Tourist tourist) async {
    await _firestoreService.updateDocument(collectionPath, tourist.id, tourist.toJson());
  }

  Future<void> deleteTourist(String id) async {
    await _firestoreService.deleteDocument(collectionPath, id);
  }
}
