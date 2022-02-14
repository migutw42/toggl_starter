import 'package:flutter/material.dart';
import 'package:toggl_starter/bloc/task_list_cubit.dart';

class TaskListTile extends StatelessWidget {
  TaskListTile({
    required this.showTask,
    required this.onTap,
  });

  final ShowTask showTask;
  final Future<void> Function(BuildContext context, ShowTask task) onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(showTask.task.content),
      subtitle: Text('project: ${showTask.project.name}'),
      trailing: IconButton(
          icon: Icon(
            Icons.play_arrow,
            color: Colors.green,
          ),
          onPressed: () => this.onTap(context, showTask)),
    );
  }
}
