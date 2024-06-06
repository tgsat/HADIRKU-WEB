import 'package:cloud_firestore/cloud_firestore.dart';

class CompanyModel {
  String id;
  String name;
  DateTime? createAt;

  CompanyModel({
    required this.id,
    required this.name,
    this.createAt,
  });

  static CompanyModel empty() => CompanyModel(id: '', name: '');

  toJson() {
    return {"ID": id, "Name": name, "CreateAt": createAt};
  }

  factory CompanyModel.fromJson(Map<String, dynamic> document) {
    final data = document;
    if (data.isEmpty) return CompanyModel.empty();
    return CompanyModel(
      id: data['Id'] ?? '',
      name: data['Name'] ?? '',
      createAt: data['CreateAt'] ?? DateTime.now(),
    );
  }

  factory CompanyModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return CompanyModel(
        id: document.id,
        name: data['Name'] ?? '',
        createAt: (data['CreateAt'] as Timestamp).toDate(),
      );
    } else {
      return CompanyModel.empty();
    }
  }
}
