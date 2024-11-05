import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:seyahat/models/message_model.dart';

class MessageService {
  final CollectionReference _messageCollection =
  FirebaseFirestore.instance.collection('Messages');

  // Send a new message
  Future<void> sendMessage(Message message) async {
    try {
      await _messageCollection.add(message.toJson());
    } catch (e) {
      throw e;
    }
  }

  // Retrieve messages between two users, ordered by timestamp
  Stream<List<Message>> getMessages(String senderID, String receiverID) {
    return _messageCollection
        .where('senderID', isEqualTo: senderID)
        .where('receiverID', isEqualTo: receiverID)
        .orderBy('timestamp', descending: false)
        .snapshots()
        .map((querySnapshot) => querySnapshot.docs
        .map((doc) => Message.fromFirestore(doc))
        .toList());
  }

  // Retrieve chat between two users (both directions)
  Stream<List<Message>> getChat(String userID1, String userID2) {
    return _messageCollection
        .where('senderID', whereIn: [userID1, userID2])
        .where('receiverID', whereIn: [userID1, userID2])
        .orderBy('timestamp', descending: false)
        .snapshots()
        .map((querySnapshot) => querySnapshot.docs
        .map((doc) => Message.fromFirestore(doc))
        .toList());
  }

  // Mark a message as read
  Future<void> markAsRead(String messageId) async {
    try {
      await _messageCollection.doc(messageId).update({'isRead': true});
    } catch (e) {
      throw e;
    }
  }

  // Delete a message
  Future<void> deleteMessage(String messageId) async {
    try {
      await _messageCollection.doc(messageId).delete();
    } catch (e) {
      throw e;
    }
  }
}
