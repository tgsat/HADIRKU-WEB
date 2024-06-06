import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hadirku_web/features/display/models/division_model.dart';
import 'package:hadirku_web/features/display/models/employee_status_model.dart';
import 'package:hadirku_web/features/display/models/position_model.dart';

class PegawaiModel {
  String id;
  String email;
  String fullName;
  String phoneNumber;
  String? nip;
  DivisionModel? divisi;
  PositionModel? position;
  DateTime? workingHours;
  double salary;
  String annualLeave;
  DateTime? workStartDate;
  EmployeeStatusModel? employeeStatus;
  DateTime? workEndDate;

  PegawaiModel({
    required this.id,
    required this.email,
    required this.fullName,
    required this.phoneNumber,
    this.nip,
    this.divisi,
    this.position,
    this.workingHours,
    required this.salary,
    required this.annualLeave,
    this.workStartDate,
    this.employeeStatus,
    this.workEndDate,
  });

  static PegawaiModel empty() => PegawaiModel(
      id: '',
      email: '',
      fullName: '',
      phoneNumber: '',
      salary: 0,
      annualLeave: '');

  toJson() {
    return {
      "Email": email,
      "FullName": fullName,
      "PhoneNumber": phoneNumber,
      "NIP": nip,
      "Division": divisi!.toJson(),
      "Position": position!.toJson(),
      "WorkingHours": workingHours,
      "Salary": salary,
      "AnnualLeave": annualLeave,
      "WorkStartDate": workStartDate,
      "Status": employeeStatus!.toJson(),
      "WorkEndDate": workEndDate,
    };
  }

  factory PegawaiModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return PegawaiModel(
        id: document.id,
        email: data['Email'] ?? '',
        fullName: data['FullName'] ?? '',
        phoneNumber: data['PhoneNumber'] ?? '',
        nip: data['NIP'] ?? '',
        divisi: DivisionModel.fromJson(data['Division']),
        position: PositionModel.fromJson(data['Position']),
        workingHours: (data['WorkingHours'] as Timestamp).toDate(),
        salary: data['Salary'] ?? 0,
        annualLeave: data['AnnualLeave'] ?? '',
        workStartDate: (data['WorkStartDate'] as Timestamp).toDate(),
        employeeStatus: EmployeeStatusModel.fromJson(data['Status']),
        workEndDate: (data['WorkEndDate'] as Timestamp).toDate(),
      );
    } else {
      return PegawaiModel.empty();
    }
  }
}
