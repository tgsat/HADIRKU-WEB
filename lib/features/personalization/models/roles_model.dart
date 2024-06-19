import 'package:cloud_firestore/cloud_firestore.dart';

class RolesModel {
  String id;
  String name;
  int level;

  RolesModel({
    required this.id,
    required this.name,
    required this.level,
  });

  static RolesModel empty() => RolesModel(id: '', name: 'Admin', level: 1);

  toJson() {
    return {"ID": id, "Name": name, "Level": level};
  }

  factory RolesModel.fromJson(Map<String, dynamic> document) {
    final data = document;
    if (data.isEmpty) return RolesModel.empty();
    return RolesModel(
      id: data['Id'] ?? '',
      name: data['Name'] ?? 'Admin',
      level: data['Level'] ?? 1,
    );
  }

  factory RolesModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return RolesModel(
        id: document.id,
        name: data['Name'] ?? '',
        level: data['Level'] as int,
      );
    } else {
      return RolesModel.empty();
    }
  }
}
