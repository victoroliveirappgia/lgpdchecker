import 'package:hive/hive.dart';

part 'checkbox_state.g.dart';

@HiveType(typeId: 0)
class CheckBoxState extends HiveObject {
  @HiveField(0)
  late String title;

  @HiveField(1)
  late bool value;

  @HiveField(2)
  late String sessionTitle;

  CheckBoxState({required this.title, required this.sessionTitle, this.value = false});
}
