import 'package:askm/data/models/chat_session.dart';
import 'package:askm/data/service/storage_service/firestore_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreServiceImpl implements FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<List<ChatSession>> loadChatSessions(String userId) async {
    final snapshot = await _firestore
        .collection('chatSessions')
        .where('userId', isEqualTo: userId)
        .get();

    return snapshot.docs
        .map((doc) => ChatSession.fromMap(doc.data(), doc.id))
        .toList();
  }

  @override
  Future<String> createNewSession(
    String userId,
    List<Map<String, String>> messages,
  ) async {
    final chatSession = ChatSession(
      id: '',
      userId: userId,
      title: messages.first['question'] ?? 'New Session',
      messages: messages,
      createdAt: DateTime.now(),
    );

    final docRef =
        await _firestore.collection('chatSessions').add(chatSession.toMap());
    return docRef.id;
  }

  @override
  Future<void> saveChatSession(
    String? currentSessionId,
    List<Map<String, String>> messages,
  ) async {
    if (currentSessionId == null || messages.isEmpty) return;

    final docRef = _firestore.collection('chatSessions').doc(currentSessionId);
    final docSnapshot = await docRef.get();

    if (docSnapshot.exists) {
      await docRef.update({
        'messages': (messages),
      });
    }
  }
}
