import 'package:app/domain/entities/cloth/cloth_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class IClothDataSource {
  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>> getClothEntity();
}
