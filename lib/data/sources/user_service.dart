import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:fiap_farms/utils/firestore_collentions.dart';
import 'package:fiap_farms/data/models/user_model.dart';
import 'package:fiap_farms/utils/result.dart';

abstract class UserService {
  Future<Result<void>> createUser(UserModel user);
  Future<Result<UserModel>> getUser(String userId);
}

class UserServiceImpl implements UserService {
  final FirebaseFirestore _firestore;

  UserServiceImpl({FirebaseFirestore? firestore})
    : _firestore = firestore ?? FirebaseFirestore.instance;

  @override
  Future<Result<void>> createUser(UserModel user) async {
    try {
      await _firestore
          .collection(FirestoreCollections.users)
          .doc(user.id)
          .set(user.toMap());

      return Result.ok(null);
    } on Exception catch (error) {
      return Result.error(error);
    }
  }

  @override
  Future<Result<UserModel>> getUser(String userId) async {
    try {
      final userDoc = await _firestore
          .collection(FirestoreCollections.users)
          .doc(userId)
          .get();

      if (!userDoc.exists) {
        return Result.error(Exception('User not found'));
      }

      return Result.ok(UserModel.fromMap(userDoc.data()!, userDoc.id));
    } on Exception catch (error) {
      return Result.error(error);
    }
  }
}
