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
  String bioData;
  String gender;
  bool selectedGender;

  UserModel({
    required this.id,
    required this.companyName,
    required this.fullName,
    required this.city,
    this.roles,
    required this.email,
    required this.phoneNumber,
    required this.profilePicture,
    required this.bioData,
    required this.gender,
    this.selectedGender = false,
  });

  // Helper function to create on empty user model
  static UserModel empty() => UserModel(
        id: '',
        companyName: '',
        fullName: '',
        city: '',
        roles: '',
        email: '',
        phoneNumber: '',
        profilePicture: '',
        bioData: '',
        gender: '',
      );

  // Convert model to JSON structure for storing data in  Firebase
  Map<String, dynamic> toJson() {
    return {
      'CompanyName': companyName,
      'FullName': fullName,
      'City': city,
      'Roles': roles,
      'Email': email,
      'PhoneNumber': phoneNumber,
      'ProfilePicture': profilePicture,
      'Bio': bioData,
      'Gender': gender,
      'SelectedGender': selectedGender,
    };
  }

  // Factory mothod to create a userModel from a  Firebase document snapshop
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
        bioData: data['Bio'] ?? '',
        gender: data['Gender'] ?? '',
        selectedGender: data['SelectedGender'] as bool,
      );
    } else {
      return UserModel.empty();
    }
  }
}
