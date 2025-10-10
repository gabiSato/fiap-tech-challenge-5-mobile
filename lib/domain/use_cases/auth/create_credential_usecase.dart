import 'package:fiap_farms/domain/repositories/auth_repository.dart';
import 'package:fiap_farms/domain/entities/user_entity.dart';

import 'package:fiap_farms/utils/result.dart';

class CreateCredentialUseCase {
  final AuthRepository _repository;

  CreateCredentialUseCase(this._repository);

  Future<Result<UserEntity>> call({
    required String email,
    required String password,
    required UserEntity user,
  }) => _repository.createCredential(email, password, user);
}
