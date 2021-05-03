import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? id;
  String? photo;
  String? name;
  String? city;
  String? email;
  String? surname;
  String? phoneNumber;
  String? aboutYourself;
  Timestamp? createdAt;
  Timestamp? updatedAt;
  UserModel({
    this.id,
    this.photo,
    this.name,
    this.surname,
    this.city,
    this.email,
    this.phoneNumber,
    this.aboutYourself,
    this.createdAt,
    this.updatedAt,
  });

  Map<String, Object?> toFirebase() {
    return {
      'id': id == null ? '' : id,
      'photo': photo == null ? '' : photo,
      'name': name == null ? '' : name,
      'surname': surname == null ? '' : surname,
      'city': city == null ? '' : city,
      'email': email == null ? '' : email,
      'phoneNumber': phoneNumber == null ? '' : phoneNumber,
      'aboutYourself': aboutYourself == null ? '' : aboutYourself,
      'createdAt': createdAt == null ? Timestamp.now() : createdAt,
      'updatedAt': updatedAt == null ? Timestamp.now() : updatedAt,
    };
  }
}
