import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

// Box is a table in hive where data is stored like this form
// index key value
// 0 'name' : 'HOzAN'

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Box myBox;

  void addData() {
    print('addData');
    myBox.put('name', 'HOzAN');

    // Add the value to the first index and shift other values
    myBox.add('AgeEd');
    myBox.add('FarHo');
  }

  void getData() {
    print('getData');
    print('${myBox.get('name', defaultValue: 'Value is null here')}');

    // index key value
    // 0 => 'name' : 'HOzAN'
    if (myBox.isNotEmpty) {
      print('getAt(0)=${myBox.getAt(0)}');
    }

    print('All keys: ${myBox.keys}');
    print('All values: ${myBox.values}');
  }

  void deleteData() {
    myBox.delete('name');
    print('deleteData');
  }

  deleteAllData() {
    myBox.deleteAll(myBox.values);
    myBox.deleteAll(myBox.keys);
    print('deleteAllData');
  }

  @override
  void initState() {
    super.initState();

    myBox = Hive.box('myBox');
  }

  @override
  void dispose() {
    super.dispose();

    Hive.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hive in Flutter')),
      body: Center(
        child: DefaultTextStyle(
          style: const TextStyle(fontSize: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  addData();
                },
                child: const Text('Add Data'),
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  getData();
                },
                child: const Text('Get Data'),
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  deleteData();
                },
                child: const Text('Delete Data'),
              ),
              ElevatedButton(
                onPressed: () {
                  deleteAllData();
                },
                child: const Text('Delete All Data'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
