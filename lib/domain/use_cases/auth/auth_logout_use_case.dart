import 'package:wc_2026_mobile/core/result.dart';
import 'package:wc_2026_mobile/data/repositories/auth_session/auth_session_repository.dart';

class const AuthLogoutUseCase({
  required final AuthSessionRepository _authSessionRepository,
}) {
  Future<Result<void>> execute() => _authSessionRepository.delete();
}
