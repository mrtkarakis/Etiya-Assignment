import 'package:dio/dio.dart';
import 'package:etiya_assignment/services/developer/developer_service.dart';
import 'package:etiya_assignment/services/network/model/base_model.dart';
import 'package:etiya_assignment/services/network/network_manager.dart';

class ApiService {
  static late Dio _dio;
  static ApiService? _instace;
  static ApiService get instance {
    if (_instace != null) return _instace!;
    _instace = ApiService._init();
    return _instace!;
  }

  ApiService._init() {
    _dio = ProjectNetworkManager.instance.dio;
  }

  Future<BaseModel> _get(
    String servicePath, {
    String? name,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    void Function(int, int)? onReceiveProgress,
  }) async {
    DeveloperService.developerLog(
      "call $name",
      name: "ApiService.$name",
    );
    final Response response = await _dio.get(
      servicePath,
      queryParameters: queryParameters,
      cancelToken: cancelToken,
      onReceiveProgress: onReceiveProgress,
      options: options,
    );
    BaseModel baseModel = response.data;
    DeveloperService.developerLog(
      "${baseModel.request}",
      name: "APIDATA.$servicePath",
    );
    return baseModel;
  }

  Future<BaseModel> getCurrrentCity(String city) async => await _get(
        "current",
        queryParameters: {
          "query": city,
        },
        name: "getCurrrentCity",
      );
}
