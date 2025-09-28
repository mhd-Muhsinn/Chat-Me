import 'package:cloud_firestore/cloud_firestore.dart';

class ChatService {
//instance of firestore
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//get user stream
  Stream<List<Map<String, dynamic>>> getUserStream() {
    return _firestore.collection("Users").snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        final user = doc.data();
        return user;
      }).toList();
    });
  }

//send message
// Future<void> sendMessage(String receiverId, Message){
  


// }
//get messages
}
