import 'dart:math';

import 'package:dart_odbc/dart_odbc.dart';
import 'package:path/path.dart' as path;
import 'package:server_awords/exports/other/utils.dart';
import 'package:server_awords/src/clickhouse/services/hello_service.dart';
import 'package:server_awords/src/clickhouse/services/state_service.dart';

class ClickDatabase extends DartODBC {
  // db name
  final dbname = 'awords';

  // tables
  final tables = {HelloService: 'my_first_table', StateService: 'state'};

  String getPath(Type type) => '$dbname.${tables[type]}';

  ClickDatabase() : super(path: path.join('/lib/x86_64-linux-gnu/libodbc.so')) {
    if (!connect(
      server: Configuration.server,
      username: Configuration.username,
      password: Configuration.password,
    )) {
      throw Exception('${Configuration.server} connection error!');
    } else {
      initDB();
      initFirstTable();
      initStateTable();
    }
  }

  void initDB() {
    exec('CREATE DATABASE IF NOT EXISTS $dbname');
  }

  void initFirstTable() {
    exec("""
CREATE TABLE IF NOT EXISTS ${getPath(HelloService)}
(
    user_id UInt32,
    message String,
    timestamp DateTime,
    metric Float32
)
ENGINE = MergeTree()
PRIMARY KEY (user_id, timestamp)
    """);
  }

  void initStateTable() {
    // create table
    exec("""
CREATE TABLE IF NOT EXISTS ${getPath(StateService)}
(
    word String,
    language String,
    state UInt8,
    user_id UInt32,
    timestamp UInt64,
)
ENGINE = MergeTree()
PRIMARY KEY (user_id, timestamp)
    """);

    // @todo
    return;

    // clear table
    exec('TRUNCATE TABLE IF EXISTS ${getPath(StateService)}');

    // insert random demo data
    List<String> insert = [];
    int getTimestamp() => DateTime.now().millisecondsSinceEpoch + random(-604800 * 1000, 604800 * 1000);

    [
      'Boat',
      'Chocolate',
      'Foot',
      'Money',
      'Name',
      'Seed',
      'Table',
      'Bell',
      'Chicken',
      'Eye',
      'Head',
      'Letter',
      'Robin',
      'Street',
      'Window',
      'Ball',
      'Cake',
      'Doll',
      'Goodbye',
      'Horse',
      'Pig',
      'Song',
      'Watch',
      'Baby',
      'Bread',
      'Day',
      'Garden',
      'Hill',
      'Party',
      'Smile',
      'Toy',
      'Bear',
      'Cat',
      'Duck',
      'Ground',
      'Kitty',
      'Rain',
      'Star',
      'Way',
      'Bath',
      'Car',
      'Door',
      'Grass',
      'House',
      'Rabbit',
      'Squirrel',
      'Water',
      'Book',
      'Coat',
      'Fire',
      'Flower',
      'Nest',
      'Sheep',
      'Thing',
      'Birth',
      'Christmas',
      'Father',
      'Milk',
      'Mother',
      'School',
      'Sun',
      'Box',
      'Corn',
      'Fish',
      'Friend',
      'Night',
      'Shoe',
      'Time',
      'Bed',
      'Chair',
      'Egg',
      'Hand',
      'Leg',
      'Stick',
      'Wind',
      'Apple',
      'Boy',
      'Cow',
      'Floor',
      'Game',
      'Paper',
      'Sister',
      'Top',
      'Back',
      'Brother',
      'Dog',
      'Girl',
      'Home',
      'Picture',
      'Snow',
      'Tree',
      'Bird',
      'Child',
      'Farm',
      'Man',
      'Morning',
      'Santa Claus',
      'Story',
      'Wood',
    ].forEach((w) {
      final int count = random(1, 867);
      for( var i = count; i >= 1; i--) {
        insert.add("('${w.toLowerCase().trim()}', 'en_EN', ${Random().nextBool()}, 1, ${getTimestamp()})");
      }
    });

    exec("""
INSERT INTO ${getPath(StateService)} (word, language, state, user_id, timestamp) VALUES
    ${insert.join(',')}
    """);
  }
}
