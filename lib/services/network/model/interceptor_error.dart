class InterceptorError {
  final String? error;
  final bool success;

  InterceptorError({
    this.error,
    this.success = false,
  });

  factory InterceptorError.fromJson(Map<String, dynamic> map) {
    return InterceptorError(error: map["error"], success: map["success"]);
  }
}
