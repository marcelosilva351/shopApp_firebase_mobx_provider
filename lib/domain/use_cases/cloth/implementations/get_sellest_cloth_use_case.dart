import 'package:app/domain/entities/cloth/cloth_entity.dart';
import 'package:app/domain/repositories/icloth_repository.dart';
import 'package:app/domain/use_cases/cloth/interfaces/iget_sellest_cloth_use_case.dart';

class GetSellestClothUserCase implements IGetSellestClothUseCase {
  late IClothRepository _clothRepository;
  GetSellestClothUserCase(IClothRepository clothRepository) {
    _clothRepository = clothRepository;
  }
  @override
  Future<List<ClothEntity>> clothsSellest() async {
    try {
      return _clothRepository.getClothSellest();
    } catch (e) {
      throw Exception();
    }
  }
}
