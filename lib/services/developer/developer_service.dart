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
    DateTime? startTime,
    DateTime? endTime,
    final async.Zone? zone,
  }) {
    time = time ?? DateTime.now();
    Duration? duration = endTime != null && startTime != null
        ? endTime.difference(startTime)
        : null;
    developer.log(
        "<<time : $time>> ${duration != null ? 'duration: ${duration.inMilliseconds},' : ""} $message",
        name: name,
        error: error,
        level: level,
        sequenceNumber: sequenceNumber,
        stackTrace: stackTrace,
        time: time,
        zone: zone);
  }
}
