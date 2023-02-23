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
  "https://api.keygenqt.com/api/ps/file/ef1fb05f-22ff-4908-acda-abf281c13987.jpeg", 
  "Animals", 
  "Various animals", 
  $timestamp, 
  $timestamp),
  
  (1, 
  "https://api.keygenqt.com/api/ps/file/b9ceb8b9-1923-42bb-96c6-5de8e5bc2495.jpeg", 
  "Flowers", 
  "Various flowers", 
  $timestamp, 
  $timestamp),
  
  (1, 
  "https://api.keygenqt.com/api/ps/file/c415fce1-57bc-4024-a034-fb021a9b5552.jpeg", 
  "Plants", 
  "Various plants", 
  $timestamp, 
  $timestamp),
  
  (1, 
  "https://api.keygenqt.com/api/ps/file/50b5600a-6792-4f2d-8355-b3e0176d56da.jpeg", 
  "Emotions", 
  "Various emotions", 
  $timestamp, 
  $timestamp),
  
  (1, 
  "https://api.keygenqt.com/api/ps/file/2b021f17-b875-4d90-81a3-80725b5241a7.jpeg", 
  "Appliances", 
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
