import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:fiap_farms/utils/firestore_collentions.dart';
import 'package:fiap_farms/data/models/sale_model.dart';
import 'package:fiap_farms/utils/result.dart';

abstract class SaleService {
  Future<Result<SaleModel>> getSale(String saleId);
  Future<Result<void>> createSale(SaleModel sale);
  Future<Result<void>> updateSale(SaleModel sale);
  Future<Result<void>> deleteSale(String saleId);
  Future<Result<List<SaleModel>>> getAllSales(String userId);
}

class SaleServiceImpl implements SaleService {
  final FirebaseFirestore _firestore;

  SaleServiceImpl({FirebaseFirestore? firestore})
    : _firestore = firestore ?? FirebaseFirestore.instance;

  @override
  Future<Result<SaleModel>> getSale(String saleId) async {
    try {
      final saleDoc = await _firestore
          .collection(FirestoreCollections.sales)
          .doc(saleId)
          .get();

      if (!saleDoc.exists) {
        return Result.error(Exception('Sale not found'));
      }

      return Result.ok(SaleModel.fromMap(saleDoc.data()!, saleDoc.id));
    } on Exception catch (error) {
      return Result.error(error);
    }
  }

  @override
  Future<Result<void>> createSale(SaleModel sale) async {
    try {
      await _firestore.collection(FirestoreCollections.sales).add(sale.toMap());

      return Result.ok(null);
    } on Exception catch (error) {
      return Result.error(error);
    }
  }

  @override
  Future<Result<void>> updateSale(SaleModel sale) async {
    try {
      await _firestore
          .collection(FirestoreCollections.sales)
          .doc(sale.id)
          .update(sale.toMap());

      return Result.ok(null);
    } on Exception catch (error) {
      return Result.error(error);
    }
  }

  @override
  Future<Result<void>> deleteSale(String saleId) async {
    try {
      await _firestore
          .collection(FirestoreCollections.sales)
          .doc(saleId)
          .delete();

      return Result.ok(null);
    } on Exception catch (error) {
      return Result.error(error);
    }
  }

  @override
  Future<Result<List<SaleModel>>> getAllSales(String userId) async {
    try {
      final saleDocs = await _firestore
          .collection(FirestoreCollections.sales)
          .where('userId', isEqualTo: userId)
          .get();

      List<SaleModel> sales = saleDocs.docs
          .map((doc) => SaleModel.fromMap(doc.data(), doc.id))
          .toList();

      return Result.ok(sales);
    } on Exception catch (error) {
      return Result.error(error);
    }
  }
}
