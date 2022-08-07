import 'package:hive/hive.dart';

part 'person.g.dart';

// HiveType helps hive generator to realize the class
@HiveType(typeId: 0)
class Person extends HiveObject {
  @HiveField(0)
  late String name;

  @HiveField(1)
  late int age;

  @HiveField(2)
  late String job;

  Person({
    required this.name,
    required this.age,
    required this.job,
  });
}

// The hive_generator package can automatically generate TypeAdapters for almost any class.
//
// 1. To generate a TypeAdapter for a class, annotate it with @HiveType and provide a typeId (between 0 and 223)
// 2. Annotate all fields which should be stored with @HiveField
// 3. Run build task "flutter packages pub run build_runner build"
// 4. Register the generated adapter
