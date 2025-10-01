import 'package:cloud_firestore/cloud_firestore.dart';

abstract class ProductService {
  Future<void> getProduct(String prodcutId);
  Future<void> createProduct();
  Future<void> updateProduct(String productId);
  Future<void> updateProductQuantity(String productId, double productQuantity);
  Future<void> getProducts(String userId);
}

class ProductServiceImpl implements ProductService {
  @override
  Future<void> getProduct(String prodcutId) async {
    try {
      DocumentSnapshot doc = await FirebaseFirestore.instance
          .collection('products')
          .doc(prodcutId)
          .get();
    } on Exception catch (error) {
      print(error);
    }
  }

  @override
  Future<void> createProduct() async {
    try {
      await FirebaseFirestore.instance.collection('products').add({
        'userId': '',
        'name': '',
        'unitOfMeasure': '',
        'quantity': 0,
      });
    } on Exception catch (error) {
      print(error);
    }
  }

  @override
  Future<void> updateProduct(String productId) async {
    try {
      await FirebaseFirestore.instance
          .collection('products')
          .doc(productId)
          .update({'name': '', 'unitOfMeasure': '', 'quantity': 0});
    } on Exception catch (error) {
      print(error);
    }
  }

  @override
  Future<void> updateProductQuantity(
    String productId,
    double productQuantity,
  ) async {
    try {
      await FirebaseFirestore.instance
          .collection('products')
          .doc(productId)
          .update({'quantity': FieldValue.increment(productQuantity)});
    } on Exception catch (error) {
      print(error);
    }
  }

  @override
  Future<void> getProducts(String userId) async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await FirebaseFirestore.instance
              .collection('products')
              .where('userId', isEqualTo: userId)
              .get();
    } on Exception catch (error) {
      print(error);
    }
  }
}
