import 'package:get_it/get_it.dart';
import 'package:website/base/app_dio.dart';
import 'package:website/build/build.config.dart';
import 'package:website/http/services/auth_service.dart';
import 'package:website/http/services/cards_service.dart';
import 'package:website/http/services/users_service.dart';
import 'package:website/model.dart';
import 'package:website/pages/cards/model.dart';
import 'package:website/pages/friends/model.dart';
import 'package:website/pages/home/model.dart';
import 'package:website/pages/sign_in/model.dart';
import 'package:website/pages/sign_up/model.dart';
import 'package:website/pages/stats/model.dart';

final getIt = GetIt.instance;

/// Initialization application DI
void setupDI(BuildConfig config) {
  final dio = configureDio(url: config.baseUrl);
  getIt
    // build info
    ..registerSingleton<BuildConfig>(config)
    // services
    ..registerSingleton<AuthService>(AuthService(dio))
    ..registerSingleton<UsersService>(UsersService(dio))
    ..registerSingleton<CardsService>(CardsService(dio))
    // pages models
    ..registerFactory<HomeModel>(() => HomeModel())
    ..registerFactory<SignInModel>(() => SignInModel())
    ..registerFactory<SignUpModel>(() => SignUpModel())
    ..registerFactory<CardsModel>(() => CardsModel())
    ..registerFactory<StatsModel>(() => StatsModel())
    ..registerFactory<FriendsModel>(() => FriendsModel())
    // other
    ..registerSingleton<AppModel>(AppModel());
}
