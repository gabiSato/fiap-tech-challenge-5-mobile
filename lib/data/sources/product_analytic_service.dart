import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:fiap_farms/data/models/product_analytic_model.dart';
import 'package:fiap_farms/utils/firestore_collentions.dart';
import 'package:fiap_farms/utils/result.dart';

abstract class ProductAnalytic {
  Future<Result<void>> createProductAnalytic(
    ProductAnalyticModel productAnalytic,
  );
  Future<Result<void>> updateProductAnalytic(
    ProductAnalyticModel productAnalytic,
  );
  Future<Result<List<ProductAnalyticModel>>> getProductsWithHighestProfit(
    String userId,
  );
}

class ProductAnalyticServiceImpl implements ProductAnalytic {
  final FirebaseFirestore _firestore;

  ProductAnalyticServiceImpl({FirebaseFirestore? firestore})
    : _firestore = firestore ?? FirebaseFirestore.instance;

  @override
  Future<Result<void>> createProductAnalytic(
    ProductAnalyticModel productAnalytic,
  ) async {
    try {
      await _firestore
          .collection(FirestoreCollections.productAnalytics)
          .doc('${productAnalytic.userId}_${productAnalytic.productId}')
          .set(productAnalytic.toMap());

      return Result.ok(null);
    } on Exception catch (error) {
      return Result.error(error);
    }
  }

  @override
  Future<Result<void>> updateProductAnalytic(
    ProductAnalyticModel productAnalytic,
  ) async {
    try {
      await _firestore
          .collection(FirestoreCollections.productAnalytics)
          .doc('${productAnalytic.userId}_${productAnalytic.productId}')
          .update({
            "totalSoldQuantity": FieldValue.increment(
              productAnalytic.totalSoldQuantity,
            ),
            "totalRevenue": FieldValue.increment(productAnalytic.totalRevenue),
            "totalProfit": FieldValue.increment(productAnalytic.totalProfit),
            "lastSaleDate": productAnalytic.lastSaleDate,
          });

      return Result.ok(null);
    } on Exception catch (error) {
      return Result.error(error);
    }
  }

  @override
  Future<Result<List<ProductAnalyticModel>>> getProductsWithHighestProfit(
    String userId,
  ) async {
    try {
      final productAnalyticDocs = await _firestore
          .collection(FirestoreCollections.productAnalytics)
          .where('userId', isEqualTo: userId)
          .orderBy('totalProfit', descending: true)
          .get();

      List<ProductAnalyticModel> productAnalytics = productAnalyticDocs.docs
          .map((doc) => ProductAnalyticModel.fromMap(doc.data()))
          .toList();

      return Result.ok(productAnalytics);
    } on Exception catch (error) {
      return Result.error(error);
    }
  }
}
