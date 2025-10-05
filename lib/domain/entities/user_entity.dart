import 'package:fiap_farms/domain/entities/location_entity.dart';

class UserEntity {
  final String? id;
  final String farmName;
  final String ownerName;
  final String email;
  final LocationEntity? location;

  UserEntity({
    this.id,
    required this.farmName,
    required this.ownerName,
    required this.email,
    this.location,
  });
}
