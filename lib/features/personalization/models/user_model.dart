import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String id;
  String companyName;
  String fullName;
  String city;
  String? roles;
  final String email;
  String phoneNumber;
  String profilePicture;
  String profileName;
  String bioData;

  UserModel({
    required this.id,
    required this.companyName,
    required this.fullName,
    required this.city,
    this.roles,
    required this.email,
    required this.phoneNumber,
    required this.profilePicture,
    required this.profileName,
    required this.bioData,
  });

  static UserModel empty() => UserModel(
        id: '',
        companyName: '',
        fullName: '',
        city: '',
        email: '',
        phoneNumber: '',
        profilePicture: '',
        profileName: '',
        bioData: '',
      );

  Map<String, dynamic> toJson() {
    return {
      'CompanyName': companyName,
      'FullName': fullName,
      'City': city,
      'Roles': roles,
      'Email': email,
      'PhoneNumber': phoneNumber,
      'ProfilePicture': profilePicture,
      'ProfileName': profileName,
      'Bio': bioData,
    };
  }

  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return UserModel(
        id: document.id,
        companyName: data['CompanyName'] ?? '',
        fullName: data['FullName'] ?? '',
        city: data['City'] ?? '',
        roles: data['Roles'] ?? '',
        email: data['Email'] ?? '',
        phoneNumber: data['PhoneNumber'] ?? '',
        profilePicture: data['ProfilePicture'] ?? '',
        profileName: data['ProfileName'] ?? '',
        bioData: data['Bio'] ?? '',
      );
    } else {
      return UserModel.empty();
    }
  }
}
