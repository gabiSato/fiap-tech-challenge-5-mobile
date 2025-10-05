import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:fiap_farms/domain/entities/location_entity.dart';
import 'package:fiap_farms/domain/entities/user_entity.dart';

class UserModel {
  final String id;
  final String farmName;
  final String ownerName;
  final String email;
  final GeoPoint? location;

  UserModel({
    required this.id,
    required this.farmName,
    required this.ownerName,
    required this.email,
    this.location,
  });

  UserEntity toEntity() {
    return UserEntity(
      id: id,
      farmName: farmName,
      ownerName: ownerName,
      email: email,
      location: location != null
          ? LocationEntity(
              latitude: location!.latitude,
              longitude: location!.longitude,
            )
          : null,
    );
  }

  factory UserModel.fromEntity(UserEntity entity) {
    return UserModel(
      id: entity.id!,
      farmName: entity.farmName,
      ownerName: entity.ownerName,
      email: entity.email,
      location: entity.location != null
          ? GeoPoint(entity.location!.latitude, entity.location!.longitude)
          : null,
    );
  }

  factory UserModel.fromMap(Map<String, dynamic> map, String id) {
    return UserModel(
      id: id,
      farmName: map['farmName'],
      ownerName: map['ownerName'],
      email: map['email'],
      location: map['location'] as GeoPoint?,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'farmName': farmName,
      'ownerName': ownerName,
      'email': email,
      'location': location,
    };
  }
}
