import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:nested/nested.dart';
import 'package:toggl_starter/bloc/task_list_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toggl_starter/entity/task.dart';
import 'package:toggl_starter/page/task_list/widgets/task_list_tile.dart';

class TaskListPage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    useEffect(() {
      () async {
        await context.read<TaskListCubit>().fetch();
      }();
      return () {};
    }, []);

    final taskList = context.watch<TaskListCubit>().state;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("toggl_starter"),
        actions: [
          IconButton(
            icon: Icon(
              Icons.settings,
            ),
            onPressed: () {
              Navigator.of(context).pushNamed('/configuration');
            },
          )
        ],
      ),
      body: Nested(
        children: [
          SingleChildBuilder(
            builder: (context, child) {
              return RefreshIndicator(
                child: child!,
                onRefresh: () async {
                  await context.read<TaskListCubit>().fetch();
                },
              );
            },
          ),
        ],
        child: ListView.builder(
          physics: AlwaysScrollableScrollPhysics(),
          itemCount: taskList.length,
          itemBuilder: (context, index) {
            final task = taskList[index];

            return TaskListTile(task: task, onTap: _startTask);
          },
        ),
      ),
    );
  }
}

Future<void> _startTask(BuildContext context, Task task) async {
  await context.read<TaskListCubit>().start(task);

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text('${task.content} is started.'),
    ),
  );
}
