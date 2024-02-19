import 'package:get/get.dart';

class SplashCOntroller extends GetxController{
  RxBool isTextFieldFocused = false.obs;
  RxBool isOtp = false.obs;

  void isSwitched(){
    isOtp.value = true;
  }

}