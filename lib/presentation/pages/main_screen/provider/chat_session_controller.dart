import 'package:askm/data/service/storage_service/firestore_service.dart';
import 'package:askm/data/models/chat_session.dart';
import 'package:askm/data/service/storage_service/firestore_service_impl.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'chat_session_controller.g.dart';

@riverpod
class ChatSessionController extends _$ChatSessionController {
  final FirestoreService firestoreService = FirestoreServiceImpl();

  @override
  void build() {}

  List<ChatSession> mockSessions = [
    ChatSession(
      title: 'Session 1',
      createdAt: DateTime.now(),
      id: '',
      messages: [],
      userId: '',
    ),
    ChatSession(
      title: 'Session 2',
      createdAt: DateTime.now(),
      id: '',
      messages: [],
      userId: '',
    ),
    ChatSession(
      title: 'Session 3',
      createdAt: DateTime.now(),
      id: '',
      messages: [],
      userId: '',
    ), //// Today
    ChatSession(
      title: 'Session 2',
      createdAt: DateTime.now().subtract(const Duration(days: 1)),
      id: '',
      messages: [],
      userId: '',
    ), // Yesterday
    ChatSession(
      title: 'Session 3',
      createdAt: DateTime.now().subtract(const Duration(days: 3)),
      id: '',
      messages: [],
      userId: '',
    ), // This Week
    ChatSession(
      title: 'Session 4',
      createdAt: DateTime.now().subtract(const Duration(days: 10)),
      id: '',
      messages: [],
      userId: '',
    ), // This Month
    ChatSession(
      title: 'Session 5',
      createdAt: DateTime.now().subtract(const Duration(days: 31)),
      id: '',
      messages: [],
      userId: '',
    ), // Older
  ];

  Future<String?> createNewSession(List<Map<String, String>> messages) async {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId != null && messages.isNotEmpty) {
      return await firestoreService.createNewSession(userId, messages);
    }
    return null;
  }

  Future<void> saveChatSession(
    String? currentSessionId,
    List<Map<String, String>> messages,
  ) async {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId != null && currentSessionId != null && messages.isNotEmpty) {
      await firestoreService.saveChatSession(currentSessionId, messages);
    }
  }

  Future<List<ChatSession>> loadChatSessions() async {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId != null) {
      return await firestoreService.loadChatSessions(userId);
    }
    return [];
  }

  Future<List<ChatSession>> loadMockChatSessions() async {
    return mockSessions;
  }
}
