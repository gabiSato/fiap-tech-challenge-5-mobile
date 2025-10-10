import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:fiap_farms/data/models/production_model.dart';
import 'package:fiap_farms/utils/firestore_collentions.dart';
import 'package:fiap_farms/utils/result.dart';

abstract class ProductionService {
  Future<Result<ProductionModel>> getProduction(String productionId);
  Future<Result<void>> createProduction(ProductionModel production);
  Future<Result<void>> updateProduction(ProductionModel production);
  Future<Result<void>> deleteProduction(String productionId);
  Future<Result<List<ProductionModel>>> getProductions(String userId);
  Future<Result<List<ProductionModel>>> getProductionsByStatus(
    String userId,
    String status,
  );
}

class ProductionServiceImpl implements ProductionService {
  final FirebaseFirestore _firestore;

  ProductionServiceImpl({FirebaseFirestore? firestore})
    : _firestore = firestore ?? FirebaseFirestore.instance;

  @override
  Future<Result<ProductionModel>> getProduction(String productionId) async {
    try {
      final productionDoc = await _firestore
          .collection(FirestoreCollections.productions)
          .doc(productionId)
          .get();

      if (!productionDoc.exists) {
        return Result.error(Exception('Production not found'));
      }

      return Result.ok(
        ProductionModel.fromMap(productionDoc.data()!, productionDoc.id),
      );
    } on Exception catch (error) {
      return Result.error(error);
    }
  }

  @override
  Future<Result<void>> createProduction(ProductionModel production) async {
    try {
      await _firestore
          .collection(FirestoreCollections.productions)
          .add(production.toMap());

      return Result.ok(null);
    } on Exception catch (error) {
      return Result.error(error);
    }
  }

  @override
  Future<Result<void>> updateProduction(ProductionModel production) async {
    try {
      await _firestore
          .collection(FirestoreCollections.productions)
          .doc(production.id)
          .update(production.toMap());

      return Result.ok(null);
    } on Exception catch (error) {
      return Result.error(error);
    }
  }

  @override
  Future<Result<void>> deleteProduction(String productionId) async {
    try {
      await _firestore
          .collection(FirestoreCollections.productions)
          .doc(productionId)
          .delete();

      return Result.ok(null);
    } on Exception catch (error) {
      return Result.error(error);
    }
  }

  @override
  Future<Result<List<ProductionModel>>> getProductions(String userId) async {
    try {
      final productionDocs = await _firestore
          .collection(FirestoreCollections.productions)
          .where('userId', isEqualTo: userId)
          .get();

      List<ProductionModel> productions = productionDocs.docs
          .map((doc) => ProductionModel.fromMap(doc.data(), doc.id))
          .toList();

      return Result.ok(productions);
    } on Exception catch (error) {
      return Result.error(error);
    }
  }

  @override
  Future<Result<List<ProductionModel>>> getProductionsByStatus(
    String userId,
    String status,
  ) async {
    try {
      final productionDocs = await _firestore
          .collection(FirestoreCollections.productions)
          .where('userId', isEqualTo: userId)
          .where('status', isEqualTo: status)
          .get();

      List<ProductionModel> productions = productionDocs.docs
          .map((doc) => ProductionModel.fromMap(doc.data(), doc.id))
          .toList();

      return Result.ok(productions);
    } on Exception catch (error) {
      return Result.error(error);
    }
  }
}
