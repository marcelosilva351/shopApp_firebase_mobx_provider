import 'package:app/domain/entities/cloth/cloth_entity.dart';

class ClothDto extends ClothEntity {
  ClothDto(String name, double value, String img, String type)
      : super(name, value, img, type);

  ClothEntity fromJson(Map map) {
    return ClothEntity(map["name"], double.parse(map["value"].toString()),
        map["img"], map["type"]);
  }
}
