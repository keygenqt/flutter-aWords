import 'package:website/entities/user.dart';

/// Extensions for [Map<String, dynamic>?]
extension ExtParse on Map<String, dynamic>? {
  /// get value from json map by types
  T? asOrNull<T>(String key) {
    if (this?[key] == null) {
      return null;
    }
    // int
    if (<T>[] is List<int> && int.tryParse(this![key].toString()) != null) {
      return int.parse(this![key].toString()) as T;
    }
    // string
    if (<T>[] is List<String>) {
      return this![key].toString() as T;
    }
    // DateTime
    if (<T>[] is List<DateTime>) {
      if (this![key] is DateTime) {
        return this![key] as T;
      } else if (this![key] is String) {
        return DateTime.parse(this![key].toString()) as T;
      }
    }
    // [UserRole]
    if (<T>[] is List<UserRole>) {
      if (this![key] is UserRole) {
        return this![key] as T;
      } else if (this![key] is int && int.tryParse(this![key].toString()) != null) {
        return UserRole.values[int.parse(this![key].toString())] as T;
      } else if (this![key] is String) {
        for (final role in UserRole.values) {
          if (role.name == this![key]) {
            return role as T;
          }
        }
      }
    }
    return null;
  }
}
