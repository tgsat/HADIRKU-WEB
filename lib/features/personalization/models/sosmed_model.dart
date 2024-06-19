import 'package:cloud_firestore/cloud_firestore.dart';

class SosmedModel {
  String id;
  late final String type;
  late final String url;

  SosmedModel({
    required this.id,
    required this.type,
    required this.url,
  });

  static SosmedModel empty() => SosmedModel(
        id: '',
        type: '',
        url: '',
      );

  Map<String, dynamic> toJson() {
    return {
      'ID': id,
      'Type': type,
      'Url': url,
    };
  }

  factory SosmedModel.fromMap(Map<String, dynamic> data) {
    return SosmedModel(
      id: data['ID'] as String,
      type: data['type'] as String,
      url: data['url'] as String,
    );
  }

  factory SosmedModel.fromDocumentSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return SosmedModel(
      id: snapshot.id,
      type: data['Type'] ?? '',
      url: data['Url'] ?? '',
    );
  }

  factory SosmedModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return SosmedModel(
        id: document.id,
        type: data['Type'] ?? '',
        url: data['Url'] ?? '',
      );
    } else {
      return SosmedModel.empty();
    }
  }
}
