import 'package:fiap_farms/domain/entities/location_entity.dart';

class UserEntity {
  final String? id;
  final String farmName;
  final String ownerName;
  final String email;
  final LocationEntity? location;

  UserEntity({
    required this.farmName,
    required this.ownerName,
    required this.email,
    this.id,
    this.location,
  });

  UserEntity copyWith({
    String? id,
    String? farmName,
    String? ownerName,
    String? email,
    LocationEntity? location,
  }) {
    return UserEntity(
      id: id ?? this.id,
      farmName: farmName ?? this.farmName,
      ownerName: ownerName ?? this.ownerName,
      email: email ?? this.email,
      location: location ?? this.location,
    );
  }
}
