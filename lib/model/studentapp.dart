import 'package:hive/hive.dart';
part 'studentapp.g.dart';

@HiveType(typeId: 1)
class studentapp {
  @HiveField(0)
  String name;
  @HiveField(1)
  String age;
  @HiveField(2)
  String contact;
  @HiveField(3)
  String email;

  studentapp(
      {required this.name,
      required this.age,
      required this.contact,
      required this.email});
}
