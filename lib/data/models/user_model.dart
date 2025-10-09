import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:fiap_farms/domain/entities/location_entity.dart';
import 'package:fiap_farms/domain/entities/user_entity.dart';

class UserModel {
  final String id;
  final String name;
  final String email;
  final String? phone;
  final String farmName;
  final Map<String, dynamic>? location;
  final String? farmAreaId;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.farmName,
    this.phone,
    this.location,
    this.farmAreaId,
    this.createdAt,
    this.updatedAt,
  });

  UserEntity toEntity() {
    return UserEntity(
      id: id,
      name: name,
      email: email,
      phone: phone,
      farmName: farmName,
      location: location != null
          ? LocationEntity(
              latitude: location!['latitude'],
              longitude: location!['longitude'],
              address: location!['address'],
            )
          : null,
      farmAreaId: farmAreaId,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

  factory UserModel.fromEntity(UserEntity entity) {
    return UserModel(
      id: entity.id!,
      name: entity.name,
      email: entity.email,
      phone: entity.phone,
      farmName: entity.farmName,
      location: entity.location != null
          ? {
              'latitude': entity.location!.latitude,
              'longitude': entity.location!.longitude,
              'address': entity.location!.address,
            }
          : null,
      farmAreaId: entity.farmAreaId,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }

  factory UserModel.fromMap(Map<String, dynamic> map, String id) {
    return UserModel(
      id: id,
      name: map['name'],
      email: map['email'],
      phone: map['phone'],
      farmName: map['farmName'],
      location: map['location'] as Map<String, dynamic>?,
      farmAreaId: map['farmAreaId'],
      createdAt: (map['createdAt'] as Timestamp?)?.toDate(),
      updatedAt: (map['updatedAt'] as Timestamp?)?.toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'farmName': farmName,
      'location': location,
      'farmAreaId': farmAreaId,
      'createdAt': createdAt != null ? Timestamp.fromDate(createdAt!) : null,
      'updatedAt': updatedAt != null ? Timestamp.fromDate(updatedAt!) : null,
    };
  }
}
