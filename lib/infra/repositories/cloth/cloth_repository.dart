import 'package:app/domain/entities/cloth/cloth_entity.dart';
import 'package:app/domain/repositories/icloth_repository.dart';
import 'package:app/infra/data_sources/icloth_data_source.dart';
import 'package:app/infra/dto/cloth/cloth_dto.dart';

class ClothRepository implements IClothRepository {
  late IClothDataSource _clothDataSource;
  ClothRepository(IClothDataSource clothDataSource) {
    _clothDataSource = clothDataSource;
  }

  @override
  Future<List<ClothEntity>> getClothSellest() async {
    var clothDto = ClothDto("", 0.0, "", "");
    List<ClothEntity> clothListReturn = [];

    var map = await _clothDataSource.getClothEntity();
    for (var cloth in map) {
      ClothEntity clothAdd = clothDto.fromJson(cloth.data());
      clothListReturn.add(clothAdd);
    }
    return clothListReturn;
  }
}
