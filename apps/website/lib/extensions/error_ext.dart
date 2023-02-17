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

  /// Get form validate
  Map<String, String> getErrors() {
    try {
      final body = (this as DioError).response!.data as Map<String, dynamic>;
      final validates = body['validates'];
      if (validates is List<dynamic>) {
        final errors = <String, String>{};
        for (var element in validates) {
          errors[element['field']] = element['message'];
        }
        return errors;
      } else {
        return {'form': body['message']!};
      }
    } catch (e) {
      final message = toString();
      if (message.contains(':')) {
        return {'form': message.split(':')[1].trim()};
      } else {
        return {'form': message};
      }
    }
  }
}
