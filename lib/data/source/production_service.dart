import 'package:cloud_firestore/cloud_firestore.dart';

abstract class ProductionService {
  Future<void> getProduction(String productionId);
  Future<void> createProduction();
  Future<void> updateProduction(String productionId);
  Future<void> deleteProduction(String productionId);
  Future<void> getProductions(String userId);
  Future<void> getProductionsByStatus(String userId, String status);
}

class ProductionServiceImpl implements ProductionService {
  @override
  Future<void> getProduction(String productionId) async {
    try {
      DocumentSnapshot doc = await FirebaseFirestore.instance
          .collection('productions')
          .doc(productionId)
          .get();
    } on Exception catch (error) {
      print(error);
    }
  }

  @override
  Future<void> createProduction() async {
    try {
      await FirebaseFirestore.instance.collection('productions').add({
        "userId": '',
        "productId": '',
        "status": 'pending',
        "quantityPlanted": 0,
        "quantityHarvested": 0,
        "startDate": null,
        "harvestDate": null,
      });
    } on Exception catch (error) {
      print(error);
    }
  }

  @override
  Future<void> updateProduction(String productionId) async {
    try {
      await FirebaseFirestore.instance
          .collection('productions')
          .doc(productionId)
          .update({
            "productId": '',
            "status": 'pending',
            "quantityPlanted": 0,
            "quantityHarvested": 0,
            "startDate": null,
            "harvestDate": null,
          });
    } on Exception catch (error) {
      print(error);
    }
  }

  @override
  Future<void> deleteProduction(String productionId) async {
    try {
      await FirebaseFirestore.instance
          .collection('productions')
          .doc(productionId)
          .delete();
    } on Exception catch (error) {
      print(error);
    }
  }

  @override
  Future<void> getProductions(String userId) async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await FirebaseFirestore.instance
              .collection('productions')
              .where('userId', isEqualTo: userId)
              .get();
    } on Exception catch (error) {
      print(error);
    }
  }

  @override
  Future<void> getProductionsByStatus(String userId, String status) async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await FirebaseFirestore.instance
              .collection('productions')
              .where('userId', isEqualTo: userId)
              .where('status', isEqualTo: status)
              .get();
    } on Exception catch (error) {
      print(error);
    }
  }
}
