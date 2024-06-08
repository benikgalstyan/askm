import 'package:askm/data/repository/repository.dart';
import 'package:askm/data/service/local_storage/local_storage_service.dart';

class RepositoryImpl implements Repository {
  const RepositoryImpl({
    required this.localStorageService,
  });

  final LocalStorageService localStorageService;
}
