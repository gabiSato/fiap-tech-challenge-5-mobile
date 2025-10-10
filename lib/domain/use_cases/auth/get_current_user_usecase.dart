import 'package:fiap_farms/domain/repositories/auth_repository.dart';
import 'package:fiap_farms/domain/entities/user_entity.dart';

import 'package:fiap_farms/utils/result.dart';

class GetCurrentUserUseCase {
  final AuthRepository _authRepository;

  GetCurrentUserUseCase(this._authRepository);

  Future<Result<UserEntity?>> call() {
    return _authRepository.getCurrentUser();
  }
}
