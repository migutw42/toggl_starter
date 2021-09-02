import 'package:flutter/material.dart';
import 'package:toggl_starter/entity/task.dart';

class TaskListTile extends StatelessWidget {
  TaskListTile({
    required this.task,
    required this.onTap,
  });

  final Task task;
  final Future<void> Function(BuildContext context, Task task) onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(task.content),
      subtitle: Text('ID: ${task.id}'),
      trailing: IconButton(
          icon: Icon(
            Icons.play_arrow,
            color: Colors.green,
          ),
          onPressed: () => this.onTap(context, task)),
    );
  }
}
