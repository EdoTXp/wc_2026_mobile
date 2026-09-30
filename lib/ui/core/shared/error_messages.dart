import 'package:wc_2026_mobile/core/exceptions/app_exception.dart';

final class ErrorMessages._() {
  static String of(AppException error) => switch (error) {
    NetworkException() =>
      'Sem conexão. Verifique sua internet e tente novamente.',

    ValidationException(:final message) => message,

    UnathorizedExecption() => 'Sua sessão expirou. Entre novamente.',

    InvalidCredentialsException() => 'E-mail ou senha inválida',

    ForbiddenException() => 'Você não tem permissão pra isso.',

    NotFoundException() => 'Não encontramos o que você procurou.',

    ServerException() =>
      'Estamos com um problema no servidor. Tente mais tarde.',

    UnknowExecption() => 'Algo deu errado. Tente novamente.',
  };
}
