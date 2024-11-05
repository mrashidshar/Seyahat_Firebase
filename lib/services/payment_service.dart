import 'package:seyahat/models/payment_model.dart';
import 'firestore_service.dart';

class PaymentService {
  final FirestoreService _firestoreService = FirestoreService();
  final String collectionPath = 'payments'; // Firestore collection name

  Future<void> addPayment(Payment payment) async {
    await _firestoreService.addDocument(collectionPath, payment.toJson());
  }

  Future<List<Payment>> getPayments() async {
    final docs = await _firestoreService.getCollection(collectionPath);
    return docs.map((doc) => Payment.fromJson(doc.data() as Map<String, dynamic>, doc.id)).toList();
  }

  Future<Payment> getPayment(String id) async {
    final doc = await _firestoreService.getDocument(collectionPath, id);
    return Payment.fromJson(doc.data() as Map<String, dynamic>, doc.id);
  }

  Future<void> updatePayment(Payment payment) async {
    await _firestoreService.updateDocument(collectionPath, payment.id, payment.toJson());
  }

  Future<void> deletePayment(String id) async {
    await _firestoreService.deleteDocument(collectionPath, id);
  }
}
