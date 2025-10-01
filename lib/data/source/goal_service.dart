import 'package:cloud_firestore/cloud_firestore.dart';

abstract class GoalService {
  Future<void> getGoal(String goalId);
  Future<void> createGoal();
  Future<void> updateGoal(String goalId);
  Future<void> deleteGoal(String goalId);
  Future<void> getAllGoals(String userId);
}

class GoalServiceImpl implements GoalService {
  @override
  Future<void> getGoal(String goalId) async {
    try {
      DocumentSnapshot doc = await FirebaseFirestore.instance
          .collection('goals')
          .doc(goalId)
          .get();
    } on Exception catch (error) {
      print(error);
    }
  }

  @override
  Future<void> createGoal() async {
    try {
      await FirebaseFirestore.instance.collection('goals').add({
        'userId': '',
        'productId': '',
        'type': '',
        'description': '',
        'targetValue': 0,
        'currentValue': 0,
        'startDate': null,
        'endDate': null,
        'status': '',
      });
    } on Exception catch (error) {
      print(error);
    }
  }

  @override
  Future<void> updateGoal(String goalId) async {
    await FirebaseFirestore.instance.collection('goals').doc(goalId).update({
      'userId': '',
      'productId': '',
      'type': '',
      'description': '',
      'targetValue': 0,
      'currentValue': 0,
      'startDate': null,
      'endDate': null,
      'status': '',
    });
  }

  @override
  Future<void> deleteGoal(String goalId) async {
    try {
      await FirebaseFirestore.instance.collection('goals').doc(goalId).delete();
    } on Exception catch (error) {
      print(error);
    }
  }

  @override
  Future<void> getAllGoals(String userId) async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await FirebaseFirestore.instance
              .collection('goals')
              .where('userId', isEqualTo: userId)
              .get();
    } on Exception catch (error) {
      print(error);
    }
  }
}
