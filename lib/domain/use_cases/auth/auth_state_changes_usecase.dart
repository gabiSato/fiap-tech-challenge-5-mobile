import 'package:fiap_farms/domain/repositories/auth_repository.dart';

class AuthStateChangesUseCase {
  final AuthRepository _authRepository;

  AuthStateChangesUseCase(this._authRepository);

  Stream<String?> call() => _authRepository.authStateChanges();
}
