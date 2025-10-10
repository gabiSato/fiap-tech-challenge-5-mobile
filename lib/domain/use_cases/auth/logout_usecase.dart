import 'package:fiap_farms/domain/repositories/auth_repository.dart';

import 'package:fiap_farms/utils/result.dart';

class LogoutUseCase {
  final AuthRepository _authRepository;

  LogoutUseCase(this._authRepository);

  Future<Result<void>> call() {
    return _authRepository.logout();
  }
}
