import 'package:fiap_farms/domain/repositories/auth_repository.dart';
import 'package:fiap_farms/domain/entities/user_entity.dart';

import 'package:fiap_farms/utils/result.dart';

class LoginUseCase {
  final AuthRepository _authRepository;

  LoginUseCase(this._authRepository);

  Future<Result<UserEntity>> call({
    required String email,
    required String password,
  }) => _authRepository.login(email, password);
}
