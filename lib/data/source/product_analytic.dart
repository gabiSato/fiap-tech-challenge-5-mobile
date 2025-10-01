import 'package:cloud_firestore/cloud_firestore.dart';

abstract class ProductAnalytic {
  Future<void> createProductAnalytic(String userId, String productId);
  Future<void> updateProductAnalytic(String userId, String productId);
  Future<void> getProductsWithHighestProfit(String userId);
}

class ProductAnalyticServiceImpl implements ProductAnalytic {
  @override
  Future<void> createProductAnalytic(String userId, String productId) async {
    try {
      await FirebaseFirestore.instance
          .collection('productAnalytics')
          .doc('${userId}_$productId')
          .set({
            "userId": '',
            "productId": '',
            "productName": '',
            "totalSoldQuantity": 0,
            "totalRevenue": 0,
            "totalProfit": 0,
            "lastSaleDate": null,
          });
    } on Exception catch (error) {
      print(error);
    }
  }

  @override
  Future<void> updateProductAnalytic(String userId, String productId) async {
    try {
      await FirebaseFirestore.instance
          .collection('productAnalytics')
          .doc('${userId}_$productId')
          .update({
            "totalSoldQuantity": FieldValue.increment(0),
            "totalRevenue": FieldValue.increment(0),
            "totalProfit": FieldValue.increment(0),
            "lastSaleDate": null,
          });
    } on Exception catch (error) {
      print(error);
    }
  }

  @override
  Future<void> getProductsWithHighestProfit(String userId) async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await FirebaseFirestore.instance
              .collection('productAnalytics')
              .where('userId', isEqualTo: userId)
              .orderBy('totalProfit', descending: true)
              .get();
    } on Exception catch (error) {
      print(error);
    }
  }
}
