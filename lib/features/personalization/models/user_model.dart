import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String id;
  String fullName;
  String city;
  String roles;
  final String email;
  String phoneNumber;
  String profilePicture;
  String profileName;
  String profileID;
  String bioData;

  UserModel({
    required this.id,
    required this.fullName,
    required this.city,
    required this.roles,
    required this.email,
    required this.phoneNumber,
    required this.profilePicture,
    required this.profileName,
    required this.profileID,
    required this.bioData,
  });

  static UserModel empty() => UserModel(
        id: '',
        fullName: '',
        city: '',
        roles: '',
        email: '',
        phoneNumber: '',
        profilePicture: '',
        profileName: '',
        profileID: '',
        bioData: '',
      );

  Map<String, dynamic> toJson() {
    return {
      'FullName': fullName,
      'City': city,
      'Roles': roles,
      'Email': email,
      'PhoneNumber': phoneNumber,
      'ProfilePicture': profilePicture,
      'ProfileName': profileName,
      'ProfileID': profileID,
      'Bio': bioData,
    };
  }

  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return UserModel(
        id: document.id,
        fullName: data['FullName'] ?? '',
        city: data['City'] ?? '',
        roles: data['Roles'] ?? '',
        email: data['Email'] ?? '',
        phoneNumber: data['PhoneNumber'] ?? '',
        profilePicture: data['ProfilePicture'] ?? '',
        profileName: data['ProfileName'] ?? '',
        profileID: data['ProfileID'] ?? '',
        bioData: data['Bio'] ?? '',
      );
    } else {
      return UserModel.empty();
    }
  }
}
