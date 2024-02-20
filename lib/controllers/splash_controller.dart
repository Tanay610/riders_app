import 'dart:async';

import 'package:get/get.dart';
import 'package:sms_autofill/sms_autofill.dart';

class SplashCOntroller extends GetxController{
  RxBool isTextFieldFocused = false.obs;
  RxBool isOtp = false.obs;

  void isSwitched(){
    isOtp.value = true;
  }

}