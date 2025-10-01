import 'package:cloud_firestore/cloud_firestore.dart';

abstract class SaleService {
  Future<void> getSale(String saleId);
  Future<void> createSale();
  Future<void> updateSale(String saleId);
  Future<void> deleteSale(String saleId);
  Future<void> getAllSales(String userId);
}

class SaleServiceImpl implements SaleService {
  @override
  Future<void> getSale(String saleId) async {
    try {
      DocumentSnapshot doc = await FirebaseFirestore.instance
          .collection('sales')
          .doc(saleId)
          .get();
    } on Exception catch (error) {
      print(error);
    }
  }

  @override
  Future<void> createSale() async {
    try {
      await FirebaseFirestore.instance.collection('sales').add({
        "userId": '',
        "productId": '',
        "saleDate": null,
        "clientName": '',
        "productName": '',
        "quantity": 0,
        "unitOfMeasure": '',
        "costPrice": 0,
        "unitPrice": 0,
        "totalAmount": 0,
        "totalProfit": 0,
      });
    } on Exception catch (error) {
      print(error);
    }
  }

  @override
  Future<void> updateSale(String saleId) async {
    try {
      await FirebaseFirestore.instance.collection('sales').doc(saleId).update({
        "productId": '',
        "saleDate": null,
        "clientName": '',
        "productName": '',
        "quantity": 0,
        "unitOfMeasure": '',
        "costPrice": 0,
        "unitPrice": 0,
        "totalAmount": 0,
        "totalProfit": 0,
      });
    } on Exception catch (error) {
      print(error);
    }
  }

  @override
  Future<void> deleteSale(String saleId) async {
    try {
      await FirebaseFirestore.instance.collection('sales').doc(saleId).delete();
    } on Exception catch (error) {
      print(error);
    }
  }

  @override
  Future<void> getAllSales(String userId) async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await FirebaseFirestore.instance
              .collection('sales')
              .where('userId', isEqualTo: userId)
              .get();
    } on Exception catch (error) {
      print(error);
    }
  }
}
