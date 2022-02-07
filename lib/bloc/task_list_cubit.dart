import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toggl_starter/entity/task.dart';
import 'package:toggl_starter/repository/task_repository.dart';

class TaskListCubit extends Cubit<List<Task>> {
  TaskListCubit({
    required TaskRepository taskRepository,
  })  : _taskRepository = taskRepository,
        super([]);
  final TaskRepository _taskRepository;

  Future<void> fetchToday() async {
		final today = DateTime.now().toUtc().toString().split(' ')[0];
		final taskList = await _taskRepository.fetchList();
		final taskListToday = taskList.where((task) => task.dueDate == today).toList();
		emit(taskListToday);
	}
  Future<void> start(Task task) async => await _taskRepository.start(task);
}
