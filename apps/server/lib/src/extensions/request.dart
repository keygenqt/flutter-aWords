import 'dart:convert';
import 'dart:io';

import 'package:jiffy/jiffy.dart';
import 'package:mason_logger/mason_logger.dart';
import 'package:server_awords/exports/apps/api/app.dart';
import 'package:server_awords/exports/db/models.dart';
import 'package:server_awords/exports/db/services.dart';
import 'package:server_awords/exports/other/utils.dart';
import 'package:server_awords/src/base/app_di.dart';
import 'package:server_awords/src/exports/other/constants.dart';

/// Extensions for [HttpRequest]
extension HttpRequestExt on HttpRequest {
  // logger for output
  Logger get _logger => getIt<Logger>();

  // services
  TokensService get _serviceTokens => getIt<TokensService>();

  UsersService get _serviceUsers => getIt<UsersService>();

  /// Add session cookie
  void setSessionCookie(UserModel user, TokenModel auth) {
    response.cookies.add(
      Cookie(
          sessionKey,
          user.generateCookieSecret(
            auth.token,
            auth.uniqueKey,
            auth.createAt,
          ))
        ..path = '/'
        ..expires = Jiffy(auth.createAt).add(months: sessionExpires).dateTime,
    );
  }

  /// Remove session cookie
  String? removeSessionCookie() {
    try {
      Cookie session = cookies.firstWhere((cookie) => cookie.name == sessionKey && cookie.httpOnly);
      final json = jsonDecode(Crypto.decrypt(session.value));
      response.cookies.add(
        Cookie(sessionKey, '-')
          ..path = '/'
          ..expires = DateTime.now(),
      );
      return json['basic']?.toString();
    } catch (e) {
      return null;
    }
  }

  /// Write json with pretty output
  void writeJson(Object? object) => writeJsonWithCode(HttpStatus.ok, object);

  /// Write json with pretty output and set code
  void writeJsonWithCode(int code, Object? object) {
    final json = jsonPrettyEncode(object);
    response
      ..statusCode = code
      ..headers.contentType = ContentType.json
      ..contentLength = utf8.encode(json).length
      ..write(json);
  }

  /// Get body map from response
  Future<Map<String, dynamic>> getBody() async => Uri.splitQueryString(await utf8.decodeStream(this));

  /// Get request int value
  int getInt() => int.tryParse(uri.pathSegments.last) == null ? 0 : int.parse(uri.pathSegments.last);

  /// Get request string value
  String getString() => RegExp(r'^[a-z\d]+\-[a-z\d]+\-[a-z\d]+\-[a-z\d]+\-[a-z\d]+$').hasMatch(uri.pathSegments.last)
      ? uri.pathSegments.last
      : throw AppException.notFound();

  /// Finding an Appropriate Method with Authorization Check
  Future<bool> route(Method method) async {
    // get mod path request
    final uriPath = uri.path
        .split('/')
        .map(
          (e) => e.replaceFirst(
            // 2b03f6be-c963-4493-8203-7928e195cc12 || 12
            RegExp(r'()([a-z\d]+\-[a-z\d]+\-[a-z\d]+\-[a-z\d]+\-[a-z\d]+)|(\d+)'),
            '___',
          ),
        )
        .join('/');

    // get mod path api
    final apiPath = method.path.split('/').map((e) => e.replaceFirst(RegExp(r'\{[a-z]+\}'), '___')).join('/');

    if (this.method == method.method.name.toUpperCase() && uriPath == apiPath) {
      // check access
      if (!method.role.contains(UserRole.guest)) {
        await _checkMethodAuth(method);
      }
      // run method
      await method.func(this);
      return true;
    } else {
      return false;
    }
  }

  /// Auth check
  Future<void> _checkMethodAuth(Method method) async {
    UserModel? model;
    String? basic;
    String? uniqueKey;

    try {
      // check cookie session
      Cookie session = cookies.firstWhere((cookie) => cookie.name == sessionKey && cookie.httpOnly);
      final json = jsonDecode(Crypto.decrypt(session.value));
      basic = json['basic']?.toString();
      uniqueKey = json['uniqueKey']?.toString();
    } catch (e) {
      // check headers session
      basic = headers.value('authorization')?.toString();
      uniqueKey = headers.value('uniquekey')?.toString();
    }

    // auth log
    _logger.detail({
      'basic': basic,
      'uniqueKey': uniqueKey,
    }.toString());

    // check value
    if (uniqueKey == null || basic == null || basic.substring(0, 5) != 'Basic') {
      throw AppException.unauthorized();
    }
    // get hash
    final hash = basic.substring(6, basic.length);
    // check db
    final token = await _serviceTokens.findByKeyAndHash(
      key: uniqueKey,
      hash: hash,
    );
    // if not found, there may be an expired check here
    if (token == null) {
      throw AppException.unauthorized();
    }
    try {
      // decrypt
      final json = jsonDecode(Crypto.decrypt(hash));
      // get model from json
      final obj = UserModel.fromJson(json as Map<String, dynamic>);
      // get model user from db
      model = await _serviceUsers.findById(
        id: obj.id!,
      );
    } catch (e) {
      throw AppException.unauthorized();
    }
    // check role
    if (!method.role.contains(model?.role)) {
      throw AppException.forbidden();
    }
  }
}
