import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:toggl_starter/entity/project.dart';
import 'package:toggl_starter/repository/tokens_repository.dart';

class ProjectProvider {
  final TokensRepository _tokensRepository;

  const ProjectProvider({
    required TokensRepository tokensRepository,
  }) : _tokensRepository = tokensRepository;

  Future<List<Project>> fetchList() async {
    final tokens = await _tokensRepository.fetch();
    final response = await http.get(
      Uri.parse('https://api.todoist.com/rest/v1/projects'),
      headers: {
        'Content-Type': 'application/json;charset=utf-8',
        'Authorization': 'Bearer ${tokens.todoist}',
      },
    );

    final projectMapList = jsonDecode(
      _decodeToUtf8(response.body),
    ) as List;

    return projectMapList
        .map((projectMap) => Project(
              id: projectMap['id'],
              name: projectMap['name'],
            ))
        .toList();
  }

  String _decodeToUtf8(String string) {
    return utf8.decode(string.runes.toList());
  }
}
