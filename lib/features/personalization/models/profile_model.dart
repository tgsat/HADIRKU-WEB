import 'package:cloud_firestore/cloud_firestore.dart';

class ProfileModel {
  String id;
  String ktp;
  String kk;
  int gender;
  int status;
  int religius;
  int golda;
  DateTime? createAt;
  DateTime? updateAt;

  ProfileModel({
    required this.id,
    required this.ktp,
    required this.kk,
    required this.gender,
    required this.status,
    required this.religius,
    required this.golda,
    this.createAt,
    this.updateAt,
  });

  static ProfileModel empty() => ProfileModel(
      id: '', ktp: '', kk: '', gender: 0, status: 0, religius: 0, golda: 0);

  toJson() {
    return {
      "ID": id,
      "KTP": ktp,
      "KK": kk,
      "Gender": gender,
      "Status": status,
      "Religius": religius,
      "Golongan Darah": golda,
      "CreateAt": createAt,
      "UpdateAt": updateAt,
    };
  }

  factory ProfileModel.fromJson(Map<String, dynamic> document) {
    final data = document;
    if (data.isEmpty) return ProfileModel.empty();
    return ProfileModel(
      id: data['Id'] ?? '',
      ktp: data['KTP'] ?? '',
      kk: data['KK'] ?? '',
      gender: data['Gender'] ?? '',
      status: data['Status'] ?? '',
      religius: data['Religius'] ?? '',
      golda: data['Golongan Darah'] ?? '',
      createAt: data['CreateAt'] ?? DateTime.now(),
      updateAt: data['UpdateAt'] ?? DateTime.now(),
    );
  }

  factory ProfileModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return ProfileModel(
        id: document.id,
        ktp: data['KTP'] ?? '',
        kk: data['KK'] ?? '',
        gender: data['Gender'] ?? 0,
        status: data['Status'] ?? 0,
        religius: data['Religius'] ?? 0,
        golda: data['Golongan Darah'] ?? 0,
        createAt: (data['CreateAt'] as Timestamp).toDate(),
        updateAt: (data['UpdateAt'] as Timestamp).toDate(),
      );
    } else {
      return ProfileModel.empty();
    }
  }
}
