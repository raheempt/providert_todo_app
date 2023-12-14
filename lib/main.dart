import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerapp/model/studentapp.dart';
import 'package:providerapp/controller/provider.dart';
import 'package:providerapp/view/home.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Directory directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  Hive.registerAdapter<studentapp>(studentappAdapter());
  await Hive.openBox<studentapp>('todobox');
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => Providerdemo(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'provider',
      home: HomePage(),
    );
  }
}
    