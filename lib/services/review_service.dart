import 'package:seyahat/models/review_model.dart';
import 'firestore_service.dart';

class ReviewService {
  final FirestoreService _firestoreService = FirestoreService();
  final String collectionPath = 'reviews'; // Firestore collection name

  Future<void> addReview(Review review) async {
    await _firestoreService.addDocument(collectionPath, review.toJson());
  }

  Future<List<Review>> getReviews() async {
    final docs = await _firestoreService.getCollection(collectionPath);
    return docs.map((doc) => Review.fromJson(doc.data() as Map<String, dynamic>, doc.id)).toList();
  }

  Future<Review> getReview(String id) async {
    final doc = await _firestoreService.getDocument(collectionPath, id);
    return Review.fromJson(doc.data() as Map<String, dynamic>, doc.id);
  }

  Future<void> updateReview(Review review) async {
    await _firestoreService.updateDocument(collectionPath, review.id, review.toJson());
  }

  Future<void> deleteReview(String id) async {
    await _firestoreService.deleteDocument(collectionPath, id);
  }
}
