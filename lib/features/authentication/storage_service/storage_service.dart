import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class StorageService extends GetxController {
  static StorageService get instance => Get.find();

  final box = GetStorage();

  Future<void> saveToken(String token) async {
    await box.write('token', token);
  }

  String? getToken() => box.read<String>('token');

  Future<void> removeToken() async {
    await box.remove('token');
  }
}
