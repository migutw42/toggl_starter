import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:toggl_starter/entity/tokens.dart';

class TokensProvider {
  final _storage = new FlutterSecureStorage();
  final TOKENS_KEY = "tokens";

  Future<Tokens> fetch() async {
    final tokensJson = await _storage.read(key: TOKENS_KEY);

    if (tokensJson != null) {
      return Tokens.fromJson(jsonDecode(tokensJson));
    } else {
      return Tokens(toggl: "", todoist: "");
    }
  }

  Future<void> save(Tokens newTokens) async {
    await _storage.write(key: "tokens", value: jsonEncode(newTokens.toJson()));
  }
}
