import 'package:askm/data/service/network_service/network_service.dart';
import 'package:dio/dio.dart';

class DioNetworkServiceImpl implements NetworkService {
  DioNetworkServiceImpl(this._dio);

  final Dio _dio;
}
