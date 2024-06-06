import 'package:cloud_firestore/cloud_firestore.dart';

class EmployeeStatusModel {
  String id;
  String status;

  EmployeeStatusModel({
    required this.id,
    required this.status,
  });

  static EmployeeStatusModel empty() => EmployeeStatusModel(id: '', status: '');

  toJson() {
    return {
      "Status": status,
    };
  }

  factory EmployeeStatusModel.fromJson(Map<String, dynamic> document) {
    final data = document;
    if (data.isEmpty) return EmployeeStatusModel.empty();
    return EmployeeStatusModel(
      id: data['Id'] ?? '',
      status: data['Status'] ?? '',
    );
  }

  factory EmployeeStatusModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return EmployeeStatusModel(
        id: document.id,
        status: data['Status'] ?? '',
      );
    } else {
      return EmployeeStatusModel.empty();
    }
  }
}
