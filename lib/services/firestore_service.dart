import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Add a document to a collection
  Future<void> addDocument(String collectionPath, Map<String, dynamic> data) async {
    try {
      await _firestore.collection(collectionPath).add(data);
    } catch (e) {
      throw Exception('Error adding document: $e');
    }
  }

  // Get a collection of documents
  Future<List<QueryDocumentSnapshot>> getCollection(String collectionPath) async {
    final snapshot = await _firestore.collection(collectionPath).get();
    return snapshot.docs;
  }

  // Get a specific document by ID
  Future<DocumentSnapshot> getDocument(String collectionPath, String id) async {
    return await _firestore.collection(collectionPath).doc(id).get();
  }

  // Update a specific document
  Future<void> updateDocument(String collectionPath, String id, Map<String, dynamic> data) async {
    await _firestore.collection(collectionPath).doc(id).update(data);
  }

  // Delete a specific document
  Future<void> deleteDocument(String collectionPath, String id) async {
    await _firestore.collection(collectionPath).doc(id).delete();
  }
}
