class BaseModel {
  final Map<String, dynamic>? request;
  final Map<String, dynamic>? error;
  final bool success;

  BaseModel({
    this.request,
    this.error,
    this.success = false,
  });

  factory BaseModel.fromJson(Map<String, dynamic> map) {
    final requestData = map["request"];
    final data = requestData is Map<String, dynamic>
        ? requestData
        : {"request": requestData};
    final errorData = map["error"];
    final error =
        errorData is Map<String, dynamic> ? errorData : {"error": errorData};
    return BaseModel(
      request: data,
      success: map["success"] ?? false,
      error: error,
    );
  }
}
