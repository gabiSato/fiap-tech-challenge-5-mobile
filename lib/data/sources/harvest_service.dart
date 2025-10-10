import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fiap_farms/data/models/harvest_model.dart';
import 'package:fiap_farms/domain/entities/harvest_entity.dart';
import 'package:fiap_farms/utils/firestore_collentions.dart';
import 'package:fiap_farms/utils/result.dart';

abstract class HarvestService {
  Future<Result<HarvestModel>> getHarvest(String harvestId);
  Future<Result<String>> createHarvest(HarvestModel harvest);
  Future<Result<void>> updateHarvest(HarvestModel harvest);
  Future<Result<void>> deleteHarvest(String harvestId);
  Future<Result<List<HarvestModel>>> getHarvestsByUserId(String userId);
  Future<Result<List<HarvestModel>>> getHarvestsByProductionId(
    String userId,
    String productionId,
  );
  Future<Result<List<HarvestModel>>> getHarvestsByQuality(
    String userId,
    HarvestQuality quality,
  );
}

class HarvestServiceImpl implements HarvestService {
  final FirebaseFirestore _firestore;

  HarvestServiceImpl({FirebaseFirestore? firestore})
      : _firestore = firestore ?? FirebaseFirestore.instance;

  @override
  Future<Result<HarvestModel>> getHarvest(String harvestId) async {
    try {
      final harvestDoc = await _firestore
          .collection(FirestoreCollections.harvests)
          .doc(harvestId)
          .get();

      if (!harvestDoc.exists) {
        return Result.error(Exception('Harvest not found'));
      }

      return Result.ok(
        HarvestModel.fromMap(harvestDoc.data()!, harvestDoc.id),
      );
    } on Exception catch (error) {
      return Result.error(error);
    }
  }

  @override
  Future<Result<String>> createHarvest(HarvestModel harvest) async {
    try {
      final docRef = await _firestore
          .collection(FirestoreCollections.harvests)
          .add(harvest.toMap());

      return Result.ok(docRef.id);
    } on Exception catch (error) {
      return Result.error(error);
    }
  }

  @override
  Future<Result<void>> updateHarvest(HarvestModel harvest) async {
    try {
      if (harvest.id == null) {
        return Result.error(Exception('Harvest ID is required for update'));
      }

      await _firestore
          .collection(FirestoreCollections.harvests)
          .doc(harvest.id)
          .update(harvest.toMap());

      return Result.ok(null);
    } on Exception catch (error) {
      return Result.error(error);
    }
  }

  @override
  Future<Result<void>> deleteHarvest(String harvestId) async {
    try {
      await _firestore
          .collection(FirestoreCollections.harvests)
          .doc(harvestId)
          .delete();

      return Result.ok(null);
    } on Exception catch (error) {
      return Result.error(error);
    }
  }

  @override
  Future<Result<List<HarvestModel>>> getHarvestsByUserId(String userId) async {
    try {
      final harvestDocs = await _firestore
          .collection(FirestoreCollections.harvests)
          .where('userId', isEqualTo: userId)
          .orderBy('harvestDate', descending: true)
          .get();

      List<HarvestModel> harvests = harvestDocs.docs
          .map((doc) => HarvestModel.fromMap(doc.data(), doc.id))
          .toList();

      return Result.ok(harvests);
    } on Exception catch (error) {
      return Result.error(error);
    }
  }

  @override
  Future<Result<List<HarvestModel>>> getHarvestsByProductionId(
    String userId,
    String productionId,
  ) async {
    try {
      final harvestDocs = await _firestore
          .collection(FirestoreCollections.harvests)
          .where('userId', isEqualTo: userId)
          .where('productionId', isEqualTo: productionId)
          .orderBy('harvestDate', descending: true)
          .get();

      List<HarvestModel> harvests = harvestDocs.docs
          .map((doc) => HarvestModel.fromMap(doc.data(), doc.id))
          .toList();

      return Result.ok(harvests);
    } on Exception catch (error) {
      return Result.error(error);
    }
  }

  @override
  Future<Result<List<HarvestModel>>> getHarvestsByQuality(
    String userId,
    HarvestQuality quality,
  ) async {
    try {
      final harvestDocs = await _firestore
          .collection(FirestoreCollections.harvests)
          .where('userId', isEqualTo: userId)
          .where('quality', isEqualTo: quality.name)
          .orderBy('harvestDate', descending: true)
          .get();

      List<HarvestModel> harvests = harvestDocs.docs
          .map((doc) => HarvestModel.fromMap(doc.data(), doc.id))
          .toList();

      return Result.ok(harvests);
    } on Exception catch (error) {
      return Result.error(error);
    }
  }
}
