import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toggl_starter/entity/project.dart';
import 'package:toggl_starter/entity/task.dart';
import 'package:toggl_starter/repository/project_repository.dart';
import 'package:toggl_starter/repository/task_repository.dart';

class TaskListCubit extends Cubit<List<ShowTask>> {
  TaskListCubit({
    required TaskRepository taskRepository,
    required ProjectRepository projectRepository,
  })  : _taskRepository = taskRepository,
        _projectRepository = projectRepository,
        super([]);
  final TaskRepository _taskRepository;
  final ProjectRepository _projectRepository;

  Future<void> fetchToday() async {
    final taskList = await _taskRepository.fetchList();
    final projectList = await _projectRepository.fetchList();

    final showTaskList = _createShowTaskList(taskList, projectList);
    emit(showTaskList);
  }

  List<ShowTask> _createShowTaskList(
      List<Task> taskList, List<Project> projectList) {
    final today = DateTime.now().toLocal().toString().split(' ')[0];
    final taskListToday =
        taskList.where((task) => task.dueDate == today).toList();
    final projectMap = Map.fromIterables(
        (projectList.map((e) => e.id)).toList(),
        (projectList.map((e) => e)).toList());

    final showTaskList = taskListToday
        .map((task) => ShowTask(
            task: task,
            project: projectMap[task.projectId]!,
            sortKey: '${task.projectId}-${task.id}'))
        .toList()
          ..sort((a, b) => a.sortKey.compareTo(b.sortKey));

    return showTaskList;
  }

  Future<void> start(Task task) async => await _taskRepository.start(task);
}

class ShowTask {
  final Task task;
  final Project project;
  final String sortKey;

  ShowTask({required this.task, required this.project, required this.sortKey});
}
