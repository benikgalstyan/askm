import 'package:askm/core/templates/typedefs.dart';
import 'package:dio/dio.dart';

typedef HeaderMap = StringMap;

abstract interface class NetworkService {
  Future<Response<T>> get<T>(
    String url, {
    required HeaderMap headers,
  });

  Future<Response<T>> post<T>(
    String url, {
    required HeaderMap headers,
    required JsonMap body,
  });

  Future<Response<T>> put<T>(
    String url, {
    required HeaderMap headers,
    required JsonMap body,
  });

  Future<Response<T>> delete<T>(
    String url, {
    required HeaderMap headers,
  });
}
