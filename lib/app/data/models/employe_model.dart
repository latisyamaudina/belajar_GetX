// employe_model.dart
class Employe {
  int id;
  String employe_name;
  String employe_role;
  String employe_phone_number;
  String employe_address;
  String? createdAt;
  String? updatedAt;
  bool isEditable; // Add this property

  Employe({
    required this.id,
    required this.employe_name,
    required this.employe_role,
    required this.employe_phone_number,
    required this.employe_address,
    this.createdAt,
    this.updatedAt,
    this.isEditable = false, // Set default value to false
  });

  factory Employe.fromJson(Map<String, dynamic> json) {
    return Employe(
      id: json['id'],
      employe_name: json['employe_name'],
      employe_role: json['employe_role'],
      employe_phone_number: json['employe_phone_number'],
      employe_address: json['employe_address'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }
}