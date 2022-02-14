import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:nested/nested.dart';
import 'package:toggl_starter/bloc/task_list_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toggl_starter/page/task_list/widgets/task_list_tile.dart';

class TaskListPage extends HookWidget {
  const TaskListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      () async {
        await context.read<TaskListCubit>().fetchToday();
      }();
      return () {};
    }, []);

    final showTaskList = context.watch<TaskListCubit>().state;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("TogglStarter"),
        actions: [
          IconButton(
            icon: const Icon(
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
                  await context.read<TaskListCubit>().fetchToday();
                },
              );
            },
          ),
        ],
        child: ListView.builder(
          physics: const AlwaysScrollableScrollPhysics(),
          itemCount: showTaskList.length,
          itemBuilder: (context, index) {
            final task = showTaskList[index];

            return TaskListTile(showTask: task, onTap: _startTask);
          },
        ),
      ),
    );
  }
}

Future<void> _startTask(BuildContext context, ShowTask showTask) async {
  await context.read<TaskListCubit>().start(showTask.task);

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text('${showTask.task.content} is started.'),
    ),
  );
}
