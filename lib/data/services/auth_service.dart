import 'package:firebase_auth/firebase_auth.dart';
import 'package:fiap_farms/utils/result.dart';

abstract class AuthService {
  Future<Result<UserCredential>> login(String email, String password);

  Future<Result<void>> logout();

  Future<Result<UserCredential>> createUser(String email, String password);

  Future<Result<User?>> getCurrentUser();
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
  Future<Result<UserCredential>> createUser(
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
}
