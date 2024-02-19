import 'package:get/get.dart';
import 'package:riders_app/controllers/splash_controller.dart';

class SplashBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(SplashCOntroller());
  }
}