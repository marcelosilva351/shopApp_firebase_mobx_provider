import 'package:app/domain/entities/cloth/cloth_entity.dart';

abstract class IClothRepository {
  Future<List<ClothEntity>> getClothSellest();
}
