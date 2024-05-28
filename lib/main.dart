import 'package:easycomply/pages/menu.dart';
import 'package:easycomply/pages/model/checkbox_state.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  var dir = await getApplicationDocumentsDirectory();

  Hive.init(dir.path);
  Hive.registerAdapter(CheckBoxStateAdapter());

  await Hive.openBox<CheckBoxState>('lgpd_checkboxes');

  runApp(
    MaterialApp(
      theme: ThemeData(unselectedWidgetColor: Colors.white),
      debugShowCheckedModeBanner: false,
      home: Menu(),
    ),
  );
}
