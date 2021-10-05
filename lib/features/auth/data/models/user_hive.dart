import 'package:hive/hive.dart';

part 'user_hive.g.dart';

@HiveType(typeId: 0)
class UserHive extends HiveObject {
  @HiveField(0)
  late String? email;
  @HiveField(1)
  late String id;
  @HiveField(2)
  late String? name;
  @HiveField(3)
  late String? photo;
}
