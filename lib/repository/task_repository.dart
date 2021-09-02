import 'package:toggl_starter/entity/task.dart';
import 'package:toggl_starter/provider/task_provider.dart';

class TaskRepository {
  const TaskRepository({
    required TaskProvider taskProvider,
  }) : _taskProvider = taskProvider;

  final TaskProvider _taskProvider;

  Future<List<Task>> fetchList() {
    return _taskProvider.fetchList();
  }

  Future<void> start(Task task) {
    return _taskProvider.start(task);
  }
}
