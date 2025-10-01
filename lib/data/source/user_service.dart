import 'package:cloud_firestore/cloud_firestore.dart';

abstract class UserService {
  Future<void> createUser();
  Future<void> getUser(String userId);
}

class UserServiceImpl implements UserService {
  @override
  Future<void> createUser() async {
    try {
      await FirebaseFirestore.instance.collection('users').doc('uid').set({
        "farmName": '',
        "ownerName": '',
        "email": '',
        "location": null,
      });
    } on Exception catch (error) {
      print(error);
    }
  }

  @override
  Future<void> getUser(String userId) async {
    try {
      DocumentSnapshot doc = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .get();
    } on Exception catch (error) {
      print(error);
    }
  }
}
