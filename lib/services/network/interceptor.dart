import 'package:dio/dio.dart';
import 'package:etiya_assignment/global.dart';
import 'package:etiya_assignment/services/developer/developer_service.dart';
import 'package:etiya_assignment/services/network/model/base_model.dart';
import 'package:etiya_assignment/services/network/model/interceptor_error.dart';

class DioInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.queryParameters["access_key"] = privateConstant.weatherstackApiKey;

    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    super.onResponse(response, handler);
    DeveloperService.developerLog(
      "onResponse $response",
      name: "DioInterceptor.onResponse",
    );
    DeveloperService.developerLog(
      "onResponse.StatusCode : ${response.statusCode}",
      name: "DioInterceptor.onResponse",
    );
    final data = response.data;

    if (data is Map<String, dynamic>) {
      final BaseModel baseModel = BaseModel.fromJson(data);
      if (baseModel.request != null) {
        response.data = baseModel;
      }
    }
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    DeveloperService.developerLog(null,
        error: "onError err: ${err.response}, handler: ${handler.future}",
        name: "DioInterceptor.onError");
    super.onError(err, handler);
    if (err.response?.data != null) {
      if (!err.response?.data["success"]) {
        InterceptorError interceptorError =
            InterceptorError.fromJson(err.response!.data);
        err.response?.data = interceptorError;
        final String errorMessage = "${interceptorError.error}";
        if (!errorMessage.contains("error_message_texts")) {
          DeveloperService.developerLog(null,
              error: errorMessage, name: "Interceptor.onError");
        }
      }
    } else {}
  }
}
