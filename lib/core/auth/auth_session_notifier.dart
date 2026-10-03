import 'dart:async';

import 'package:material_ui/material_ui.dart';
import 'package:wc_2026_mobile/core/logging/app_logger.dart';
import 'package:wc_2026_mobile/core/result.dart';
import 'package:wc_2026_mobile/domain/auth_session.dart';
import 'package:wc_2026_mobile/domain/use_cases/auth/auth_logout_use_case.dart';
import 'package:wc_2026_mobile/domain/use_cases/auth/auth_restore_session_use_case.dart';

class AuthSessionNotifier({
  required final AuthLogoutUseCase _authLogoutUseCase,
  required final AuthRestoreSessionUseCase _authRestoreSessionUseCase,
}) extends ChangeNotifier {
  final _log = AppLogger('AuthSessionNotifier');

  AuthSessionUser? _user;
  var _restored = false;

  bool get isRestored => _restored;
  AuthSessionUser? get user => _user;
  bool get isSignedIn => _user != null;

  this {
    unawaited(_restore());
  }

  Future<void> _restore() async {
    final restored = await _authRestoreSessionUseCase.execute();

    if (_restored) return;

    switch (restored) {
      case Ok<AuthSessionUser?>(:final value):
        _user = value;
        _log.info(value == null ? 'No session stored' : 'session restored');
      case Error<AuthSessionUser?>(:final error):
        _log.error('Error on read stored session', error: error);
    }

    _restored = true;
    notifyListeners();
  }

  String get initials {
    final name = _user?.name.trim() ?? '';

    if (name.isEmpty) return '';

    final words = name.split(RegExp(r'\s+'));
    final first = words.first[0];
    return (words.length == 1 ? first : first + words.last[0]).toUpperCase();
  }

  void signedIn(AuthSessionUser user) {
    _user = user;
    _restored = true;
    _log.info('Session started');
    notifyListeners();
  }

  Future<void> logout() async {
    final logout = await _authLogoutUseCase.execute();

    if (logout case Error(:final error)) {
      _log.error('Error to delete token on logout', error: error);
    }

    final changed = _user != null || !_restored;

    _user = null;
    _restored = true;

    if (!changed) return;

    _log.info('Session stopped.');
    notifyListeners();
  }
}
