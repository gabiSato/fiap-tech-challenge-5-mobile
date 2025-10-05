import 'package:fiap_farms/domain/repositories/auth_repository.dart';
import 'package:fiap_farms/domain/entities/user_entity.dart';

import 'package:fiap_farms/data/sources/auth_service.dart';
import 'package:fiap_farms/data/sources/user_service.dart';
import 'package:fiap_farms/data/models/user_model.dart';

import 'package:fiap_farms/utils/result.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthService _authService;
  final UserService _userService;

  AuthRepositoryImpl(this._authService, this._userService);

  @override
  Future<Result<UserEntity>> login(String email, String password) async {
    final loginResult = await _authService.login(email, password);

    return switch (loginResult) {
      Ok(value: final credential) when credential.user != null =>
        _getUserEntity(credential.user!.uid),
      Error(error: final error) => Result.error(error),
      _ => Result.error(Exception('Login failed: User is null')),
    };
  }

  @override
  Future<Result<UserEntity>> createCredential(
    String email,
    String password,
    UserEntity user,
  ) async {
    final credentialResult = await _authService.createCredential(
      email,
      password,
    );

    return switch (credentialResult) {
      Ok(value: final credential) when credential.user != null =>
        await _createAndGetUserEntity(credential.user!.uid, user),
      Error(error: final error) => Result.error(error),
      _ => Result.error(Exception('Create credential failed: User is null')),
    };
  }

  @override
  Stream<String?> authStateChanges() {
    return _authService.authStateChanges();
  }

  @override
  Future<Result<void>> logout() {
    return _authService.logout();
  }

  Future<Result<UserEntity>> _getUserEntity(String uid) async {
    final userResult = await _userService.getUser(uid);
    return switch (userResult) {
      Ok(value: final userModel) => Result.ok(userModel.toEntity()),
      Error(error: final error) => Result.error(error),
    };
  }

  Future<Result<UserEntity>> _createAndGetUserEntity(
    String userUid,
    UserEntity user,
  ) async {
    final userWithId = user.copyWith(id: userUid);
    final userModel = UserModel.fromEntity(userWithId);
    final createResult = await _userService.createUser(userModel);

    return switch (createResult) {
      Ok() => Result.ok(userModel.toEntity()),
      Error(error: final error) => Result.error(error),
    };
  }
}
