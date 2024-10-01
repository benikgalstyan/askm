import 'package:askm/data/models/chat_session.dart';

abstract class FirestoreService {
  Future<void> saveChatSession(
    String? currentSessionId,
    List<Map<String, String>> messages,
  );

  Future<String> createNewSession(
    String userId,
    List<Map<String, String>> messages,
  );

  Future<List<ChatSession>> loadChatSessions(String userId);
}
