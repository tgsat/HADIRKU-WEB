import 'package:cloud_firestore/cloud_firestore.dart';

class RolesModel {
  String id;
  String roles;
  DateTime? createAt;

  RolesModel({
    required this.id,
    required this.roles,
    this.createAt,
  });

  static RolesModel empty() => RolesModel(id: '', roles: '');

  toJson() {
    return {"ID": id, "Roles": roles, "CreateAt": createAt};
  }

  factory RolesModel.fromJson(Map<String, dynamic> document) {
    final data = document;
    if (data.isEmpty) return RolesModel.empty();
    return RolesModel(
      id: data['Id'] ?? '',
      roles: data['Roles'] ?? '',
      createAt: data['CreateAt'] ?? DateTime.now(),
    );
  }

  factory RolesModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return RolesModel(
        id: document.id,
        roles: data['Roles'] ?? '',
        createAt: (data['CreateAt'] as Timestamp).toDate(),
      );
    } else {
      return RolesModel.empty();
    }
  }
}
