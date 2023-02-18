import 'package:flutter/widgets.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:website/base/app_di.dart';
import 'package:website/extensions/error_ext.dart';
import 'package:website/http/services/users_service.dart';
import 'package:website/models/user.dart';
import 'package:website/pages/home/page.dart';

/// Model for [HomePage]
class HomeModel extends Model {
  /// Get [ScopedModel]
  static HomeModel of(BuildContext context) => ScopedModel.of<HomeModel>(context);

  /// Get service users
  final UsersService service = getIt<UsersService>();

  /// Error response
  bool _loading = false;

  bool get loading => _loading;

  /// Error response
  String? _error;

  String? get error => _error;

  /// Users response
  List<UserModel>? _users;

  List<UserModel>? get users => _users;

  /// Get users
  Future<void> getList() async {
    _loading = true;
    notifyListeners();
    try {
      _users = await service.getList();
    } catch (e) {
      _error = e.getMessage();
    }
    _loading = false;
    notifyListeners();
  }
}
