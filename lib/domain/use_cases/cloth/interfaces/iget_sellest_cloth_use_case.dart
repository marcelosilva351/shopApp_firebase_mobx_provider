import 'package:app/domain/entities/cloth/cloth_entity.dart';

abstract class IGetSellestClothUseCase {
  Future<List<ClothEntity>> clothsSellest();
}
