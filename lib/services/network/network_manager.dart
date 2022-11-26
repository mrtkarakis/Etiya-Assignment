import 'package:dio/dio.dart';
import 'package:etiya_assignment/services/network/interceptor.dart';

class ProjectNetworkManager {
  static const _timeOut = 8000;
  static ProjectNetworkManager? _instace;
  static ProjectNetworkManager get instance {
    if (_instace != null) return _instace!;
    _instace = ProjectNetworkManager._init();
    return _instace!;
  }

  static const String _baseUrl = 'http://api.weatherstack.com/';

  static String get getBaseUrl => _baseUrl;
  late final Dio dio;

  ProjectNetworkManager._init() {
    dio = Dio(
      BaseOptions(
        baseUrl: getBaseUrl,
        connectTimeout: _timeOut,
        receiveTimeout: _timeOut,
      ),
    );

    dio.interceptors.add(DioInterceptor());
  }
}
