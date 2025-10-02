import 'package:firebase_auth/firebase_auth.dart';
import 'package:fiap_farms/utils/result.dart';

// TODO: Criar as classes de modelos
// TODO: Passar classe abstrata para a camada de domínio
abstract class AuthService {
  Future<Result<UserCredential>> login(String email, String password);
  Future<Result<void>> logout();
  Future<Result<UserCredential>> createCredential(
    String email,
    String password,
  );
  Future<Result<User?>> getCurrentUser();
  Stream<User?> authStateChanges();
}

class AuthServiceImpl implements AuthService {
  @override
  Future<Result<UserCredential>> login(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return Result.ok(userCredential);
    } on Exception catch (error) {
      return Result.error(error);
    }
  }

  @override
  Future<Result<void>> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      return Result.ok(null);
    } on Exception catch (error) {
      return Result.error(error);
    }
  }

  @override
  Future<Result<UserCredential>> createCredential(
    String email,
    String password,
  ) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return Result.ok(userCredential);
    } on Exception catch (error) {
      return Result.error(error);
    }
  }

  @override
  Future<Result<User?>> getCurrentUser() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      return Result.ok(user);
    } on Exception catch (error) {
      return Result.error(error);
    }
  }

  @override
  Stream<User?> authStateChanges() {
    return FirebaseAuth.instance.authStateChanges();
  }
}
