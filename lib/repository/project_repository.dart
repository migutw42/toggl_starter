import 'package:toggl_starter/entity/project.dart';
import 'package:toggl_starter/provider/project_provider.dart';

class ProjectRepository {
  const ProjectRepository({
    required ProjectProvider projectProvider,
  }) : _taskProvider = projectProvider;

  final ProjectProvider _taskProvider;

  Future<List<Project>> fetchList() {
    return _taskProvider.fetchList();
  }
}
