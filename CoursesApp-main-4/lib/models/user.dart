import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String id;
  final String name;
  final String email;
  final String coverImage;

  User(this.id, this.name, this.email, this.coverImage);

  static parse(DocumentSnapshot<Map<String, dynamic>> data) {
    return User(data['id'], data['name'], data['email'], data['coverImage']);
  }
}
