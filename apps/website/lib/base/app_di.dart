import 'package:get_it/get_it.dart';
import 'package:website/base/app_dio.dart';
import 'package:website/model.dart';
import 'package:website/pages/home/model.dart';
import 'package:website/services/users_service.dart';

final getIt = GetIt.instance;

/// Initialization application DI
void setupDI() {
  final dio = configureDio();
  getIt
    // other
    ..registerSingleton<AppModel>(AppModel())
    //
    ..registerSingleton<UsersService>(UsersService(dio))
    // pages models
    ..registerFactory<HomeModel>(() => HomeModel());
}
