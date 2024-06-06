import 'package:cloud_firestore/cloud_firestore.dart';

class DivisionModel {
  String id;
  String name;

  DivisionModel({
    required this.id,
    required this.name,
  });

  static DivisionModel empty() => DivisionModel(id: '', name: '');

  toJson() {
    return {
      "Name": name,
    };
  }

  factory DivisionModel.fromJson(Map<String, dynamic> document) {
    final data = document;
    if (data.isEmpty) return DivisionModel.empty();
    return DivisionModel(
      id: data['Id'] ?? '',
      name: data['Name'] ?? '',
    );
  }

  factory DivisionModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return DivisionModel(
        id: document.id,
        name: data['Name'] ?? '',
      );
    } else {
      return DivisionModel.empty();
    }
  }
}
