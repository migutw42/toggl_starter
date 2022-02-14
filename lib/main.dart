import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nested/nested.dart';
import 'package:toggl_starter/bloc/task_list_cubit.dart';
import 'package:toggl_starter/bloc/tokens_cubit.dart';
import 'package:toggl_starter/provider/project_provider.dart';
import 'package:toggl_starter/provider/task_provider.dart';
import 'package:toggl_starter/provider/tokens_provider.dart';
import 'package:toggl_starter/repository/project_repository.dart';
import 'package:toggl_starter/repository/task_repository.dart';
import 'package:toggl_starter/repository/tokens_repository.dart';
import 'package:toggl_starter/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Nested(
      children: [
        RepositoryProvider(
          create: (context) =>
              TokensRepository(tokensProvider: TokensProvider()),
        ),
        RepositoryProvider(
          create: (context) => TaskRepository(
            taskProvider: TaskProvider(
              tokensRepository: context.read<TokensRepository>(),
            ),
          ),
        ),
        RepositoryProvider(
          create: (context) => ProjectRepository(
            projectProvider: ProjectProvider(
              tokensRepository: context.read<TokensRepository>(),
            ),
          ),
        ),
        BlocProvider(
          create: (BuildContext context) => TokensCubit(
            tokensRepository: context.read<TokensRepository>(),
          ),
        ),
        BlocProvider(
          create: (BuildContext context) => TaskListCubit(
            taskRepository: context.read<TaskRepository>(),
            projectRepository: context.read<ProjectRepository>(),
          ),
        ),
      ],
      child: MaterialApp(
        initialRoute: '/',
        routes: routes,
      ),
    );
  }
}
