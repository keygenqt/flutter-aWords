import 'package:get_it/get_it.dart';
import 'package:website/base/app_dio.dart';
import 'package:website/http/services/auth_service.dart';
import 'package:website/http/services/users_service.dart';
import 'package:website/model.dart';
import 'package:website/pages/home/model.dart';
import 'package:website/pages/login/model.dart';

final getIt = GetIt.instance;

/// Initialization application DI
void setupDI(bool isRelease) {
  final dio = configureDio(
    url: isRelease ? 'https://awords.keygenqt.com/' : 'https://awords-api.keygenqt.com/'
  );
  getIt
    // other
    ..registerSingleton<AppModel>(AppModel())
    //
    ..registerSingleton<AuthService>(AuthService(dio))
    ..registerSingleton<UsersService>(UsersService(dio))
    // pages models
    ..registerFactory<HomeModel>(() => HomeModel())
    ..registerFactory<LoginModel>(() => LoginModel());
}
