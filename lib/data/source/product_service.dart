import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fiap_farms/data/model/product_model.dart';
import 'package:fiap_farms/utils/result.dart';

abstract class ProductService {
  Future<Result<ProductModel>> getProduct(String prodcutId);
  Future<Result<void>> createProduct(ProductModel product);
  Future<Result<void>> updateProduct(ProductModel product);
  Future<Result<void>> updateProductQuantity(
    String productId,
    double productQuantity,
  );
  Future<Result<List<ProductModel>>> getProducts(String userId);
}

class ProductServiceImpl implements ProductService {
  @override
  Future<Result<ProductModel>> getProduct(String prodcutId) async {
    try {
      final productDoc = await FirebaseFirestore.instance
          .collection('products')
          .doc(prodcutId)
          .get();

      if (!productDoc.exists) {
        return Result.error(Exception('Product not found'));
      }

      return Result.ok(ProductModel.fromMap(productDoc.data()!, productDoc.id));
    } on Exception catch (error) {
      return (Result.error(error));
    }
  }

  @override
  Future<Result<void>> createProduct(ProductModel product) async {
    try {
      await FirebaseFirestore.instance
          .collection('products')
          .add(product.toMap());

      return Result.ok(null);
    } on Exception catch (error) {
      return Result.error(error);
    }
  }

  @override
  Future<Result<void>> updateProduct(ProductModel product) async {
    try {
      await FirebaseFirestore.instance
          .collection('products')
          .doc(product.id)
          .update(product.toMap());

      return Result.ok(null);
    } on Exception catch (error) {
      return Result.error(error);
    }
  }

  @override
  Future<Result<void>> updateProductQuantity(
    String productId,
    double productQuantity,
  ) async {
    try {
      await FirebaseFirestore.instance
          .collection('products')
          .doc(productId)
          .update({'quantity': FieldValue.increment(productQuantity)});

      return Result.ok(null);
    } on Exception catch (error) {
      return Result.error(error);
    }
  }

  @override
  Future<Result<List<ProductModel>>> getProducts(String userId) async {
    try {
      final productDocs = await FirebaseFirestore.instance
          .collection('products')
          .where('userId', isEqualTo: userId)
          .get();

      List<ProductModel> products = productDocs.docs
          .map((doc) => ProductModel.fromMap(doc.data(), doc.id))
          .toList();

      return Result.ok(products);
    } on Exception catch (error) {
      return Result.error(error);
    }
  }
}
