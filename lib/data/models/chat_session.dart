import 'package:cloud_firestore/cloud_firestore.dart';

class ChatSession {
  ChatSession({
    required this.id,
    required this.userId,
    required this.title,
    required this.messages,
    required this.createdAt,
  });

  factory ChatSession.fromMap(Map<String, dynamic> data, String documentId) {
    return ChatSession(
      id: documentId,
      userId: data['userId'] as String,
      title: data['title'] as String,
      messages: List<Map<String, String>>.from(
        (data['messages'] as List).map((message) {
          return Map<String, String>.from(message);
        }),
      ),
      createdAt: (data['createdAt'] as Timestamp).toDate(),
    );
  }

  final String id;
  final String userId;
  final String title;
  final List<Map<String, String>> messages;
  final DateTime createdAt;

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'title': title,
      'messages': messages,
      'createdAt': FieldValue.serverTimestamp(),
    };
  }
}
