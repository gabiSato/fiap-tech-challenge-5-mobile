import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:fiap_farms/data/models/product_analytic_model.dart';
import 'package:fiap_farms/utils/firestore_collentions.dart';
import 'package:fiap_farms/utils/result.dart';

abstract class ProductAnalyticService {
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

class ProductAnalyticServiceImpl implements ProductAnalyticService {
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
            "totalQuantitySold": FieldValue.increment(
              productAnalytic.totalQuantitySold,
            ),
            "totalRevenue": FieldValue.increment(productAnalytic.totalRevenue),
            "totalCost": FieldValue.increment(productAnalytic.totalCost),
            "profit": FieldValue.increment(productAnalytic.profit),
            "profitMargin": productAnalytic.profitMargin,
            "averagePrice": productAnalytic.averagePrice,
            "lastUpdated": productAnalytic.lastUpdated,
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
          .map((doc) => ProductAnalyticModel.fromMap(doc.data(), doc.id))
          .toList();

      return Result.ok(productAnalytics);
    } on Exception catch (error) {
      return Result.error(error);
    }
  }
}
