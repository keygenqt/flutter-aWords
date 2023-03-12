import 'package:server_awords/exports/apps/api/app.dart';
import 'package:server_awords/exports/db/models.dart';
import 'package:server_awords/exports/other/extensions.dart';

/// Validate [StateModel]
void validateState(Map<String, dynamic> json) {
  final errors = <Validate>[];

  // fields
  const fieldWord = 'word';

  // validate word
  if (json[fieldWord] == null || json[fieldWord].toString().isEmpty) {
    errors.add(
      Validate(
        field: fieldWord,
        message: '${fieldWord.capitalize()} is required',
      ),
    );
  }

  if (errors.isNotEmpty) {
    throw AppException.unprocessableEntity(errors);
  }
}
