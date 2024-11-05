import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  String senderID;
  String receiverID;
  String content;
  Timestamp timestamp;
  bool isRead;

  Message({
    required this.senderID,
    required this.receiverID,
    required this.content,
    required this.timestamp,
    this.isRead = false,
  });

  // Factory constructor to create a Message object from Firestore data
  factory Message.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return Message(
      senderID: data['senderID'] ?? '',
      receiverID: data['receiverID'] ?? '',
      content: data['content'] ?? '',
      timestamp: data['timestamp'] ?? Timestamp.now(),
      isRead: data['isRead'] ?? false,
    );
  }

  // Method to convert a Message object to a Firestore document
  Map<String, dynamic> toJson() {
    return {
      'senderID': senderID,
      'receiverID': receiverID,
      'content': content,
      'timestamp': timestamp,
      'isRead': isRead,
    };
  }
}
