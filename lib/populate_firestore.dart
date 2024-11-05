// import 'dart:core';
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'services/firestore_service.dart';
//
// import 'models/local_guide_model.dart';
// import 'models/message_model.dart';
// import 'models/payment_model.dart';
// import 'models/place_model.dart';
// import 'models/review_model.dart';
// import 'models/tourist_model.dart';
// import 'models/trip_model.dart';
// import 'models/trip_proposal_model.dart';
// import 'models/user_model.dart';
//
// Future<void> populateFirestore() async {
//   // Initialize Firebase
//   await Firebase.initializeApp();
//
//   // Get Firestore instance
//   final firestore = FirebaseFirestore.instance;
//
//   // Create and add example entities
//
//   // Example Place
//   Place place = Place(
//     id: 'sfd',
//     name: 'Example Place',
//     longitude: 73.123456,
//     latitude: 33.123456,
//     description: 'This is an example place.',
//     gallery: ['url1', 'url2'],
//     thumbnail: 'thumbnail_url',
//     starRating: 3,
//   );
//   await firestore.collection('places').add(place.toJson());
//
//   // Example User
//   User user = User(
//     name: 'John Doe',
//     email: 'john@example.com',
//     password: 'securepassword',
//     dob: DateTime(1990, 1, 1),
//     type: 'tourist',
//     id: 'sds',
//   );
//   await firestore.collection('users').add(user.toJson());
//
//   // Example Review
//   Review review = Review(
//     id:'sdsds',
//     componentId: '',
//     touristId: '',
//     message: 'Great place to visit!',
//     starRating: 5,
//   );
//   await firestore.collection('reviews').add(review.toJson());
//
//   // Example Tourist
//   Tourist tourist = Tourist(
//     userId: 'sds',
//     nationality: 'American',
//     languages: ['English', 'Spanish'], id: '',
//   );
//   await firestore.collection('tourists').add(tourist.toJson());
//
//   // Example Local Guide
//   LocalGuide localGuide = LocalGuide(
//     userId: 'ssc23',
//     isOnline: true,
//     isBooked: false,
//     starRating: 5,
//     languages: ['English', 'French'], id: '',
//   );
//   await firestore.collection('local_guides').add(localGuide.toJson());
//
//   // Example Trip Proposal
//   TripProposal tripProposal = TripProposal(
//     startTime: DateTime.now(),
//     endTime: DateTime.now().add(Duration(days: 3)),
//     touristId: 'sds23',
//     destination: 'Example Place',
//     status: 'PENDING', id: '',
//   );
//   await firestore.collection('trip_proposals').add(tripProposal.toJson());
//
//   // Example Trip
//   Trip trip = Trip(
//     guideId: 'jshw3',
//     proposalId: '', id: '',
//   );
//   await firestore.collection('trips').add(trip.toJson());
//
//   // Example Payment
//   Payment payment = Payment(
//     tripId: '',
//     amount: 100.00,
//     status: 'PAID', id: '',
//   );
//   await firestore.collection('payments').add(payment.toJson());
//
//   // Example Message
//   Message message = Message(
//     senderID: 'user_1',
//     receiverID: 'user_2',
//     timestamp: now(),
//     content: 'Hello!',
//   );
//   await firestore.collection('messages').add(message.toJson());
//
//   print('All entities created in Firestore successfully.');
// }
//
// now() {
//   final now = DateTime.now();
//   return now;
// }
