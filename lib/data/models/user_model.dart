class UserModel {
  final String id;
  final String farmName;
  final String ownerName;
  final String email;
  final String? location;

  UserModel({
    required this.id,
    required this.farmName,
    required this.ownerName,
    required this.email,
    this.location,
  });

  factory UserModel.fromMap(Map<String, dynamic> map, String id) {
    return UserModel(
      id: id,
      farmName: map['farmName'] ?? '',
      ownerName: map['ownerName'] ?? '',
      email: map['email'] ?? '',
      location: map['location'],
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
