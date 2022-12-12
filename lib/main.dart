import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

import 'helper/data_helper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DataBaseHelper.instance.init();
  runApp(Container());
}
