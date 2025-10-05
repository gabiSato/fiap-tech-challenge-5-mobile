import 'package:firebase_auth/firebase_auth.dart';

import 'package:fiap_farms/utils/result.dart';

abstract class AuthService {
  Future<Result<UserCredential>> login(String email, String password);
  Future<Result<void>> logout();
  Future<Result<UserCredential>> createCredential(
    String email,
    String password,
  );
  Future<Result<User?>> getCurrentUser();
  Stream<String?> authStateChanges();
}

class AuthServiceImpl implements AuthService {
  final FirebaseAuth _auth;

  AuthServiceImpl({FirebaseAuth? auth}) : _auth = auth ?? FirebaseAuth.instance;

  @override
  Future<Result<UserCredential>> login(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return Result.ok(userCredential);
    } on Exception catch (error) {
      return Result.error(error);
    }
  }

  @override
  Future<Result<void>> logout() async {
    try {
      await _auth.signOut();
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
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      return Result.ok(userCredential);
    } on Exception catch (error) {
      return Result.error(error);
    }
  }

  @override
  Future<Result<User?>> getCurrentUser() async {
    try {
      User? user = _auth.currentUser;
      return Result.ok(user);
    } on Exception catch (error) {
      return Result.error(error);
    }
  }

  @override
  Stream<String?> authStateChanges() {
    return _auth.authStateChanges().map((user) => user?.uid);
  }
}
