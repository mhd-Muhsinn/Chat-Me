import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  final String receiverEmail;
  final String receriverName;
  final String receiverId;
  ChatPage({super.key, required this.receiverEmail,re, required this.receriverName, required this.receiverId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(receriverName),
      ),
    );
  }
}
