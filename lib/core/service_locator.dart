import 'package:askm/data/repository/repository.dart';
import 'package:askm/data/repository/repository_impl.dart';
import 'package:askm/data/service/local_storage/shared_pref_storage_service.dart';
import 'package:askm/data/service/network_service/dio_network_service_impl.dart';
import 'package:askm/data/service/network_service/network_service.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
final getDio = getIt.get<Dio>();

void setupServicesLocator() {
  final localeStorage = SharedPrefsStorageService();
  getIt.registerSingleton<NetworkService>(DioNetworkServiceImpl(getDio));
  getIt.registerSingleton<Repository>(RepositoryImpl(
    localStorageService: localeStorage,
  ));
}
