import 'package:server_awords/exports/apps/api/app.dart';
import 'package:server_awords/exports/other/extensions.dart';
import 'package:validated/validated.dart' as validated;

/// Validate login form
void validateLogin(Map<String, dynamic> json) {
  final errors = <Validate>[];

  // fields
  const fieldEmail = 'email';
  const fieldPwd = 'password';
  const fieldUniqueKey = 'uniqueKey';

  // validate email
  if (json[fieldEmail] == null || json[fieldEmail].toString().isEmpty) {
    errors.add(
      Validate(
        field: fieldEmail,
        message: '${fieldEmail.capitalize()} is required',
      ),
    );
  } else if (!validated.isEmail(json[fieldEmail].toString())) {
    errors.add(
      Validate(
        field: fieldEmail,
        message: '${fieldEmail.capitalize()} is not match',
      ),
    );
  }

  // validate password
  if (json[fieldPwd] == null || json[fieldPwd].toString().isEmpty) {
    errors.add(
      Validate(
        field: fieldPwd,
        message: '${fieldPwd.capitalize()} is required',
      ),
    );
  } else if (!validated.isLength(json[fieldPwd].toString(), 8, 16)) {
    errors.add(
      Validate(
        field: fieldPwd,
        message: '${fieldPwd.capitalize()} min 8 max 16.',
      ),
    );
  }

  // validate uniqueKey
  if (json[fieldUniqueKey] == null || json[fieldUniqueKey].toString().isEmpty) {
    errors.add(
      Validate(
        field: fieldUniqueKey,
        message: '${fieldUniqueKey.capitalize()} is required',
      ),
    );
  }

  if (errors.isNotEmpty) {
    throw AppException.unprocessableEntity(errors);
  }
}
