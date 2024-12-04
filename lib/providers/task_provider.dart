import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../notifiers/task_notifier.dart';

final taskNotifierProvider = ChangeNotifierProvider<TaskNotifier>((ref) {
  return TaskNotifier();
});
