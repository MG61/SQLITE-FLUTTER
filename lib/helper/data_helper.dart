import 'dart:developer';

import 'dart:io';

import 'package:sqlitepaxomov/models/proizvoditel.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:sqlitepaxomov/request/data_request.dart';

import 'package:sqlitepaxomov/models/check.dart';
import 'package:sqlitepaxomov/models/client.dart';
import 'package:sqlitepaxomov/models/deliver.dart';
import 'package:sqlitepaxomov/models/employee.dart';
import 'package:sqlitepaxomov/models/proizvoditel.dart';
import 'package:sqlitepaxomov/models/sklad.dart';
import 'package:sqlitepaxomov/models/store.dart';
import 'package:sqlitepaxomov/models/tovar.dart';
import 'package:sqlitepaxomov/models/type.dart';

class DataBaseHelper {
  static final instance = DataBaseHelper._instance();

  DataBaseHelper._instance();

  final int _version = 1;
  late final String _pathDB;
  late final Directory _appDocumentDirectory;
  late final Database database;

  Future<void> init() async {
    _appDocumentDirectory =
    await path_provider.getApplicationDocumentsDirectory();

    _pathDB = join(_appDocumentDirectory.path, 'test.db');
    print(_pathDB);
    if (Platform.isLinux || Platform.isWindows || Platform.isMacOS ) {
      sqfliteFfiInit();
      database = await databaseFactoryFfi.openDatabase(_pathDB,
          options: OpenDatabaseOptions(
            version: _version,
            onUpgrade: (db, oldVersion, newVersion) => onUpdateTable(db),
            onCreate: (db, version) => onCreateTable(db),
          ));
    } else {
      database = await openDatabase(
        _pathDB,
        version: _version,
        onUpgrade: (db, oldVersion, newVersion) => onUpdateTable(db),
        onCreate: (db, version) => onCreateTable(db),
      );
    }
  }

  Future<void> onCreateTable(Database db) async {
    for (var tableCreate in DataBaseRequest.tableCreateList) {
      await db.execute(tableCreate);
    }
    await onInitTable(db);
  }

  Future<void> onUpdateTable(Database db) async {
    var tables = await db.rawQuery('SELECT name FROM sqlite_master');
    for (var table in DataBaseRequest.tableList.reversed) {
      if (tables.where((element) => element['name'] == table).isNotEmpty) {
        await db.execute(DataBaseRequest.deleteTable(table));
      }
    }
    await onCreateTable(db);
  }

  Future<void> onInitTable(Database db) async {
    try {

      db.insert(
        DataBaseRequest.tablecheck,
        check(
            Name: "Велосипед STELS",
            Quantity: "1",
            Summ: "14000").toMap(),
      );

      db.insert(
        DataBaseRequest.tableclient,
        client(
            Surname: "Абраменко",
            Number: "89773773422").toMap(),
      );

      db.insert(
        DataBaseRequest.tabledeliver,
        deliver(
            Surname_dost: "Syglaev",
            Address: "Chalova 44",
            Name: "Велосипед STELS",
            Summ: "14000").toMap(),
      );

      db.insert(
        DataBaseRequest.tableemployee,
        employee(
          Surname: "Абраменко",
          Number: "89773773422",
          Email: "abramenko0431@gmail.com").toMap(),
      );

      db.insert(
        DataBaseRequest.tableproizvoditel,
        proizvoditel(
            Name: "ООО Фирма",
            Address: "Golyzin 13",
            Number: "89343443944").toMap(),
      );

      db.insert(
        DataBaseRequest.tablesklad,
        sklad(
          Name: "Doloxov",
          Quantity: "1",
          Summ: "323232"). toMap(),
      );

      db.insert(
        DataBaseRequest.tablestore,
        store(
          Name: "Велосипеды",
          Address: 'Topolnaya 33'
        ).toMap(),
      );

      db.insert(
        DataBaseRequest.tabletovar,
        tovar(
          Name: 'Велосипед STELS',
          Price: '14000',
          proizv: "ООО Фирма",
        ).toMap(),
      );

      db.insert(
        DataBaseRequest.tabletype,
        type(
          Name: 'Горный'
        ).toMap(),
      );
    } on DatabaseException catch (error) {
      print(error.result);
    }
  }

  Future<void> onDropDataBase() async {
    await database.close();
    if (Platform.isLinux || Platform.isWindows || Platform.isMacOS) {
      databaseFactoryFfi.deleteDatabase(_pathDB);
    } else {
      deleteDatabase(_pathDB);
    }
  }
}
