import 'package:fiap_farms/domain/entities/user_entity.dart';
import 'package:fiap_farms/utils/result.dart';

abstract class AuthRepository {
  Future<Result<UserEntity>> login(String email, String password);
  Future<Result<void>> logout();
  Future<Result<UserEntity>> createCredential(
    String email,
    String password,
    UserEntity user,
  );
  Stream<String?> authStateChanges();
}
