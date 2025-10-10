import 'package:fiap_farms/domain/entities/location_entity.dart';

class UserEntity {
  final String? id;
  final String name;
  final String email;
  final String? phone;
  final String farmName;
  final LocationEntity? location;
  final String? farmAreaId;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  UserEntity({
    required this.name,
    required this.email,
    required this.farmName,
    this.id,
    this.phone,
    this.location,
    this.farmAreaId,
    this.createdAt,
    this.updatedAt,
  });

  UserEntity copyWith({
    String? id,
    String? name,
    String? email,
    String? phone,
    String? farmName,
    LocationEntity? location,
    String? farmAreaId,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return UserEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      farmName: farmName ?? this.farmName,
      location: location ?? this.location,
      farmAreaId: farmAreaId ?? this.farmAreaId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
