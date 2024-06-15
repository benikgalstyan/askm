import 'package:askm/data/models/facts.dart';

abstract interface class Repository {
  Future<Facts> getFacts();
}
