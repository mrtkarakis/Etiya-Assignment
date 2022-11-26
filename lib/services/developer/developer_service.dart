import 'dart:async' as async;
import 'dart:developer' as developer;

class DeveloperService {
  static void developerLog(
    String? message, {
    final String name = "developerLog",
    final Object? error,
    final int level = 0,
    final int? sequenceNumber,
    final StackTrace? stackTrace,
    DateTime? time,
    final async.Zone? zone,
  }) {
    time = time ?? DateTime.now();
    developer.log("<<time : $time>> $message",
        name: name,
        error: error,
        level: level,
        sequenceNumber: sequenceNumber,
        stackTrace: stackTrace,
        time: time,
        zone: zone);
  }
}
