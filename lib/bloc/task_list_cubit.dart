import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toggl_starter/entity/task.dart';
import 'package:toggl_starter/repository/task_repository.dart';

class TaskListCubit extends Cubit<List<Task>> {
  TaskListCubit({
    required TaskRepository taskRepository,
  })  : _taskRepository = taskRepository,
        super([]);
  final TaskRepository _taskRepository;

  Future<void> fetch() async => emit(await _taskRepository.fetchList());

  Future<void> start(Task task) async => await _taskRepository.start(task);
}
