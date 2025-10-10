import 'package:fiap_farms/domain/entities/user_entity.dart';
import 'package:fiap_farms/utils/result.dart';

abstract class UserRepository {
  Future<Result<void>> createUser(UserEntity user);
  Future<Result<UserEntity>> getUser(String userId);
}
