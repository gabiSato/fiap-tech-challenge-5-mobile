import 'package:fiap_farms/domain/repositories/user_repository.dart';
import 'package:fiap_farms/domain/entities/user_entity.dart';

import 'package:fiap_farms/data/sources/user_service.dart';
import 'package:fiap_farms/data/models/user_model.dart';

import 'package:fiap_farms/utils/result.dart';

class UserRepositoryImpl implements UserRepository {
  final UserService _userService;

  UserRepositoryImpl(this._userService);

  @override
  Future<Result<void>> createUser(UserEntity user) async {
    final userModel = UserModel.fromEntity(user);
    return _userService.createUser(userModel);
  }

  @override
  Future<Result<UserEntity>> getUser(String userId) async {
    final result = await _userService.getUser(userId);

    return switch (result) {
      Ok(value: final userModel) => Result.ok(userModel.toEntity()),
      Error(error: final error) => Result.error(error),
    };
  }
}
