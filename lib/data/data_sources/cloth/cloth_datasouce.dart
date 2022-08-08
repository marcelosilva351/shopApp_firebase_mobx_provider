import 'package:app/infra/data_sources/icloth_data_source.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ClothDataSource implements IClothDataSource {
  var firebaseFirestore = FirebaseFirestore.instance;
  @override
  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>>
      getClothEntity() async {
    return FirebaseFirestore.instance
        .collection("cloths")
        .where("sellest", isEqualTo: true)
        .get()
        .then((value) => value.docs);
  }
}
