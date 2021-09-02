import 'package:toggl_starter/entity/tokens.dart';
import 'package:toggl_starter/provider/tokens_provider.dart';

class TokensRepository {
  const TokensRepository({
    required TokensProvider tokensProvider,
  }) : _tokensProvider = tokensProvider;

  final TokensProvider _tokensProvider;

  Future<Tokens> fetch() async {
    return await _tokensProvider.fetch();
  }

  Future<void> save(Tokens newTokens) async {
    await _tokensProvider.save(newTokens);
  }
}
