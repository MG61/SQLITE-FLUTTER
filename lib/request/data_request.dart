abstract class DataBaseRequest {
  static String deleteTable(String table) => 'DROP TABLE $table';

  static const String tablecheck = 'check';
  static const String tableclient = 'client';
  static const String tabledeliver = 'deliver';
  static const String tableemployee = 'employee';
  static const String tableproizvoditel = 'proizvoditel';
  static const String tablesklad = 'sklad';
  static const String tablestore = 'store';
  static const String tabletovar = 'tovar';
  static const String tabletype = 'type';

  static const List<String> tableList = [
    tablecheck,
    tableclient,
    tabledeliver,
    tableemployee,
    tableproizvoditel,
    tablesklad,
    tablestore,
    tabletovar,
    tabletype
  ];

  static const List<String> tableCreateList = [
    _createTablecheck,
    _createTableclient,
    _createTabledeliver,
    _createTableemployee,
    _createTableproizvoditel,
    _createTablesklad,
    _createTablestore,
    _createTabletovar,
    _createTabletype
  ];

  static const String _createTablecheck =
      'CREATE TABLE "$tablecheck" ("id" INTEGER,"Name" TEXT NOT NULL,"Quantity" TEXT NOT NULL,"Summ" TEXT NOT NULL, PRIMARY KEY("id" AUTOINCREMENT))';
  static const String _createTableclient =
      'CREATE TABLE "$tableclient" ("id" INTEGER,"Surname" TEXT NOT NULL,"Number" TEXT NOT NULL, PRIMARY KEY("id" AUTOINCREMENT))';
  static const String _createTabledeliver =
      'CREATE TABLE "$tabledeliver" ("id" INTEGER,"Surname_dost" TEXT NOT NULL ,"Address" TEXT NOT NULL , "Name" TEXT NOT NULL,"Summ" TEXT NOT NULL, PRIMARY KEY("id" AUTOINCREMENT))';
  static const String _createTableemployee =
      'CREATE TABLE "$tableemployee" ("id" INTEGER,"Surname" TEXT NOT NULL ,"Number" TEXT NOT NULL, "Email" TEXT NOT NULL, PRIMARY KEY("id" AUTOINCREMENT))';
  static const String _createTableproizvoditel =
      'CREATE TABLE "$tableproizvoditel" ("id" INTEGER,"Name" TEXT NOT NULL,"Address" TEXT NOT NULL,"Number" TEXT NOT NULL, PRIMARY KEY("id" AUTOINCREMENT))';
  static const String _createTablesklad =
      'CREATE TABLE "$tablesklad" ("id"	INTEGER,"Name"	TEXT NOT NULL,"Quantity"	TEXT NOT NULL,"Summ"	TEXT NOT NULL, PRIMARY KEY("id" AUTOINCREMENT))';
  static const String _createTablestore =
      'CREATE TABLE "$tablestore" ("id" INTEGER,"Name" TEXT NOT NULL,"Address" TEXT NOT NULL, PRIMARY KEY("id" AUTOINCREMENT))';
  static const String _createTabletovar =
      'CREATE TABLE "$tabletovar" ("id" INTEGER,"Name" TEXT NOT NULL,"Price" TEXT NOT NULL,"proizv" TEXT NOT NULL, PRIMARY KEY("id" AUTOINCREMENT))';
  static const String _createTabletype =
      'CREATE TABLE "$tabletype" ("id" INTEGER,"Name" TEXT NOT NULL, PRIMARY KEY("id" AUTOINCREMENT))';
}