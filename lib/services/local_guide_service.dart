import 'package:seyahat/models/local_guide_model.dart';
import 'firestore_service.dart';

class LocalGuideService {
  final FirestoreService _firestoreService = FirestoreService();
  final String collectionPath = 'localGuides'; // Firestore collection name

  Future<void> addLocalGuide(LocalGuide guide) async {
    await _firestoreService.addDocument(collectionPath, guide.toJson());
  }

  Future<List<LocalGuide>> getLocalGuides() async {
    final docs = await _firestoreService.getCollection(collectionPath);
    return docs.map((doc) => LocalGuide.fromJson(doc.data() as Map<String, dynamic>, doc.id)).toList();
  }

  Future<LocalGuide> getLocalGuide(String id) async {
    final doc = await _firestoreService.getDocument(collectionPath, id);
    return LocalGuide.fromJson(doc.data() as Map<String, dynamic>, doc.id);
  }

  Future<void> updateLocalGuide(LocalGuide guide) async {
    await _firestoreService.updateDocument(collectionPath, guide.id, guide.toJson());
  }

  Future<void> deleteLocalGuide(String id) async {
    await _firestoreService.deleteDocument(collectionPath, id);
  }
}
