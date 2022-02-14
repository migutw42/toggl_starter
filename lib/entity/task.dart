class Task {
  const Task({
    required this.id,
    required this.content,
    required this.dueDate,
    required this.projectId,
  });

  final int id;
  final String content;
  final String dueDate;
  final int projectId;
}
