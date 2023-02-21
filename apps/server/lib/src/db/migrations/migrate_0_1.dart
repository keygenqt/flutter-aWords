import 'package:server_awords/exports/db/database.dart';
import 'package:server_awords/exports/db/models.dart';
import 'package:server_awords/exports/other/extensions.dart';

// ignore_for_file: camel_case_types
// set demo data
class Migrate_0_1 {
  Future<void> onInit(MyDatabase d) async {
    // insert demo users
    await setUsers(d);
    // insert demo cards
    await setCards(d);
  }

  // insert demo users
  Future<void> setCards(MyDatabase d) async {
    // get actual table name
    final table = d.cards.actualTableName;

    // get columns table
    final columns = d.cards.columnsByName.keys
        .where((e) => e != 'id')
        .map((e) => '"$e"')
        .join(',');

    final timestamp = (DateTime.now().millisecondsSinceEpoch / 1000).round();

    // insert values
    await d.customInsert('''
INSERT INTO "$table" ($columns) VALUES
  (1, 
  "https://api.keygenqt.com/api/ps/file/bc838bad-848f-4c33-ad24-b9a288ba7408.png", 
  "Animals", 
  "Various animals", 
  $timestamp, 
  $timestamp),
  
  (1, 
  "https://api.keygenqt.com/api/ps/file/bc838bad-848f-4c33-ad24-b9a288ba7408.png", 
  "Flowers", 
  "Various flowers", 
  $timestamp, 
  $timestamp),
  
  (1, 
  "https://api.keygenqt.com/api/ps/file/e2a1e83f-3159-4c42-891b-73a8f8fb8f35.png", 
  "Plants", 
  "Various plants", 
  $timestamp, 
  $timestamp),
  
  (1, 
  "https://api.keygenqt.com/api/ps/file/85668291-bab8-4970-81b7-90aa8151a201.png", 
  "Emotions", 
  "Various emotions", 
  $timestamp, 
  $timestamp),
  
  (1, 
  "https://api.keygenqt.com/api/ps/file/e2a1e83f-3159-4c42-891b-73a8f8fb8f35.png", 
  "Technique", 
  "Home appliances", 
  $timestamp, 
  $timestamp);
''');
  }

  // insert demo users
  Future<void> setUsers(MyDatabase d) async {
    // get actual table name
    final table = d.users.actualTableName;

    // get columns table
    final columns = d.users.columnsByName.keys
        .where((e) => e != 'id')
        .map((e) => '"$e"')
        .join(',');

    // insert values
    await d.customInsert('''
INSERT INTO "$table" ($columns) VALUES
  ("Оля", "best1@email.com", "${'12345678'.asMD5()}", ${UserRole.user.index}),
  ("Юля", "best2@email.com", "${'12345678'.asMD5()}", ${UserRole.user.index}),
  ("Муля", "best3@email.com", "${'12345678'.asMD5()}", ${UserRole.user.index}),
  ("Гуля", "best4@email.com", "${'12345678'.asMD5()}", ${UserRole.user.index});
''');
  }
}
