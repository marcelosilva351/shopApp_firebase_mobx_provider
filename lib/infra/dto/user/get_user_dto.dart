import 'package:app/domain/entities/user_info/user_entity.dart';

class GetUsetDto extends UserEntity {
  GetUsetDto(String email, String img) : super(email, img);

  static GetUsetDto fromJson(Map json) {
    return GetUsetDto(json["email"], json["img"]);
  }
}
