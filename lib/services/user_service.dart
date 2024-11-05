import 'package:seyahat/models/user_model.dart';
import 'firestore_service.dart';

class UserService {
  final FirestoreService _firestoreService = FirestoreService();
  final String collectionPath = 'users'; // Firestore collection name

  Future<void> addUser(Users user) async {
    try {
      await _firestoreService.addDocument(collectionPath, user.toJson());
    } catch (e) {
      throw Exception('Error adding user: $e');
    }
  }

  Future<List<Users>> getUsers() async {
    final docs = await _firestoreService.getCollection(collectionPath);
    return docs.map((doc) => Users.fromJson(doc.data() as Map<String, dynamic>, doc.id)).toList();
  }

  Future<Users> getUser(String id) async {
    final doc = await _firestoreService.getDocument(collectionPath, id);
    return Users.fromJson(doc.data() as Map<String, dynamic>, doc.id);
  }

  Future<void> updateUser(Users user) async {
    await _firestoreService.updateDocument(collectionPath, user.id, user.toJson());
  }

  Future<void> deleteUser(String id) async {
    await _firestoreService.deleteDocument(collectionPath, id);
  }
}
