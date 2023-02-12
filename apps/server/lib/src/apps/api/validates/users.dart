import 'package:server_awords/exports/apps/api.dart';
import 'package:server_awords/exports/db/models.dart';
import 'package:server_awords/exports/other/extensions.dart';
import 'package:validated/validated.dart' as validated;

/// Validate [UserModel] create
void validateUser(Map<String, dynamic> json, {bool update = false}) {
  final errors = <Validate>[];

  // fields
  const fieldName = 'name';
  const fieldEmail = 'email';
  const fieldPwd = 'password';

  // validate name
  if (!update && json[fieldName] == null) {
    errors.add(
      Validate(
        field: fieldName,
        message: '${fieldName.capitalize()} is required',
      ),
    );
  }

  // validate email
  if (!update && json[fieldEmail] == null) {
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
  if (!update && json[fieldPwd] == null) {
    errors.add(
      Validate(
        field: fieldPwd,
        message: '${fieldName.capitalize()} is required',
      ),
    );
  } else if (!validated.isLength(json[fieldPwd].toString(), 8, 16)) {
    errors.add(
      Validate(
        field: fieldPwd,
        message: '${fieldName.capitalize()} min 8 max 16.',
      ),
    );
  }

  if (errors.isNotEmpty) {
    throw AppException.unprocessableEntity(errors);
  }
}
