// main.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'tokens.freezed.dart';
part 'tokens.g.dart';

@freezed
class Tokens with _$Tokens {
  const Tokens._();

  const factory Tokens({
    required String toggl,
    required String todoist,
  }) = _Tokens;

  factory Tokens.fromJson(Map<String, dynamic> json) => _$TokensFromJson(json);

  bool isValid() {
    return toggl.isNotEmpty && todoist.isNotEmpty;
  }
}
