import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive_local_storage/my_home_page.dart';
import 'package:path_provider/path_provider.dart';

import 'models/person.dart';

// TypeAdapter which converts the object from and to binary form.

// When you want Hive to use a TypeAdapter, you have to register it.
// Two things are needed for that: An instance of the adapter and a typeId.
// Every type has a unique typeId which is used to find the correct adapter
// when a value is brought back from disk. All typeIds between 0 and 223 are allowed.

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Get the path of the local storage
  Directory dir = await getApplicationDocumentsDirectory();

  await Hive.initFlutter(dir.path);
  // Register the generated adapter
  Hive.registerAdapter(PersonAdapter());
  await Hive.openBox<Person>('person');

  // await Hive.openBox('myBox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Hive',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}
