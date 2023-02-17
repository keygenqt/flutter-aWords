import 'package:dio/dio.dart';

/// Extensions for [Exception]
extension ExtError on Object {
  /// Get error message
  String getMessage() {
    try {
      final body = (this as DioError).response!.data as Map<String, dynamic>;
      return body['message']!;
    } catch (e) {
      final message = toString();
      if (message.contains(':')) {
        return message.split(':')[1].trim();
      } else {
        return message;
      }
    }
  }
}
