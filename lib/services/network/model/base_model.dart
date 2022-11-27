class BaseModel {
  final Map<String, dynamic>? data;
  final bool success;

  BaseModel({
    this.data,
    this.success = false,
  });

  factory BaseModel.fromJson(Map<String, dynamic> map) {
    final mapData = map["data"];
    final data = mapData is Map<String, dynamic> ? mapData : {"data": mapData};
    return BaseModel(
      data: data,
      success: map["success"] ?? false,
    );
  }
}
