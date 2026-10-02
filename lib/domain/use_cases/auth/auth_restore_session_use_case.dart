import 'package:wc_2026_mobile/core/result.dart';
import 'package:wc_2026_mobile/data/repositories/auth_session/auth_session_repository.dart';
import 'package:wc_2026_mobile/domain/auth_session.dart';

class const AuthRestoreSessionUseCase({
  required final AuthSessionRepository _authSessionRepository,
}) {
  Future<Result<AuthSessionUser?>> execute() async {
    final session = await _authSessionRepository.fetch();
    return switch (session) {
      Ok<AuthSession?>(:final value) => Result.ok(value?.user),
      Error<AuthSession?>(:final error) => Result.error(error),
    };
  }
}
