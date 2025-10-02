import 'package:fiap_farms/domain/entities/location.dart';

class User {
  final String? id;
  final String farmName;
  final String ownerName;
  final String email;
  final Location? location;

  User({
    this.id,
    required this.farmName,
    required this.ownerName,
    required this.email,
    this.location,
  });
}
