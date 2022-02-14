import 'dart:convert';

import 'package:toggl_starter/entity/task.dart';
import 'package:toggl_starter/repository/tokens_repository.dart';
import 'package:http/http.dart' as http;

class TaskProvider {
  const TaskProvider({
    required TokensRepository tokensRepository,
  }) : _tokensRepository = tokensRepository;

  final TokensRepository _tokensRepository;

  Future<List<Task>> fetchList() async {
    final tokens = await _tokensRepository.fetch();
    final response = await http.get(
      Uri.parse('https://api.todoist.com/rest/v1/tasks'),
      headers: {
        'Content-Type': 'application/json;charset=utf-8',
        'Authorization': 'Bearer ${tokens.todoist}',
      },
    );

    final taskMapList = jsonDecode(
      _decodeToUtf8(response.body),
    ) as List;

    return taskMapList
        .map((taskMap) => Task(
              id: taskMap['id'],
              content: taskMap['content'],
              dueDate: taskMap.containsKey('due') &&
                      taskMap['due'].containsKey('date')
                  ? taskMap['due']['date']
                  : '',
              projectId: taskMap['project_id'],
            ))
        .toList();
  }

  Future<void> start(Task task) async {
    final tokens = await _tokensRepository.fetch();
    final basicAuthToken = base64Encode('${tokens.toggl}:api_token'.codeUnits);

    final requestBody = {
      'time_entry': {
        'description': task.content,
        'created_with': 'toggl_started',
      },
    };

    await http.post(
      Uri.parse('https://api.track.toggl.com/api/v8/time_entries/start'),
      headers: {
        'Content-Type': 'application/json;charset=utf-8',
        'Authorization': 'Basic ${basicAuthToken}',
      },
      body: json.encode(requestBody),
    );
  }

  String _decodeToUtf8(String string) {
    return utf8.decode(string.runes.toList());
  }
}
