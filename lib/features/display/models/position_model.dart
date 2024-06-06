import 'package:cloud_firestore/cloud_firestore.dart';

class PositionModel {
  String id;
  String name;

  PositionModel({
    required this.id,
    required this.name,
  });

  static PositionModel empty() => PositionModel(id: '', name: '');

  toJson() {
    return {
      "Name": name,
    };
  }

  factory PositionModel.fromJson(Map<String, dynamic> document) {
    final data = document;
    if (data.isEmpty) return PositionModel.empty();
    return PositionModel(
      id: data['Id'] ?? '',
      name: data['Name'] ?? '',
    );
  }

  factory PositionModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return PositionModel(
        id: document.id,
        name: data['Name'] ?? '',
      );
    } else {
      return PositionModel.empty();
    }
  }
}
