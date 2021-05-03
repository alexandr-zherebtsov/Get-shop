import 'package:cloud_firestore/cloud_firestore.dart';

class AdvertModel {
  final String? id;
  final String? uid;
  final String? headline;
  final int? price;
  final String? description;
  final List<dynamic>? images;
  final Timestamp? createdAt;
  final Timestamp? updatedAt;
  final List<dynamic>? saved;

  AdvertModel({
    this.id,
    this.uid,
    this.headline,
    this.price,
    this.description,
    this.images,
    this.createdAt,
    this.updatedAt,
    this.saved,
  });

  Map<String, Object?> toFirebase() {
    return {
      'id': id == null ? '' : id,
      'uid': uid == null ? '' : uid,
      'headline': headline == null ? '' : headline,
      'price': price == null ? 0 : price,
      'description': description == null ? '' : description,
      'images': images == null ? [] : images,
      'createdAt': createdAt == null ? Timestamp.now() : createdAt,
      'updatedAt': updatedAt == null ? Timestamp.now() : updatedAt,
      'saved': saved == null ? [] : saved,
    };
  }
}
