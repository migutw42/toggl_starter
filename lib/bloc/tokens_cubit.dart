import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toggl_starter/entity/tokens.dart';
import 'package:toggl_starter/repository/tokens_repository.dart';

class TokensCubit extends Cubit<Tokens> {
  TokensCubit({
    required TokensRepository tokensRepository,
  })  : _tokensRepository = tokensRepository,
        super(Tokens(
          toggl: "",
          todoist: "",
        ));
  final TokensRepository _tokensRepository;

  Future<void> fetch() async => emit(await _tokensRepository.fetch());

  Future<void> save(Tokens newTokens) async {
    await _tokensRepository.save(newTokens);
    emit(await _tokensRepository.fetch());
  }
}
