import 'package:askm/data/models/facts.dart';
import 'package:askm/data/repository/repository.dart';
import 'package:askm/data/service/local_storage/local_storage_service.dart';
import 'package:askm/data/service/network_service/network_service.dart';

class RepositoryImpl implements Repository {
  const RepositoryImpl({
    required this.networkService,
    required this.localStorageService,
  });

  final LocalStorageService localStorageService;
  final NetworkService networkService;

  static const _factsLink = 'https://cat-fact.herokuapp.com/facts/random?animal_type=cat';
  static const _keyOfFact = 'text';

  @override
  Future<Facts> getFacts() async {
    final response = await networkService.get(_factsLink, headers: {});
    final jsonData = response.data as Map<String, dynamic>;
    return Facts(jsonData[_keyOfFact]);
  }
}
