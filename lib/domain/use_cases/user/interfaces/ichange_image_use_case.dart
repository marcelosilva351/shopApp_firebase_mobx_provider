import 'dart:io';

abstract class IChangeImageUseCase {
  Future<bool> chengeImage(File image, String email);
}
