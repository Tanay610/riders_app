
import 'dart:async';

import 'package:get/get.dart';
import 'package:sms_autofill/sms_autofill.dart';

class OtpController extends GetxController with CodeAutoFill{
  RxString? appSignature;
  RxString otpCode = '1234'.obs;
  RxString phoneNumber = ''.obs;
  
  String signature = "{{ app signature }}";

   RxBool isTextFieldFocused = false.obs;
  RxBool isOtp = false.obs;
   RxBool isResendEnabled = false.obs;
  
  Timer? _timer;
  int remainingSeconds = 1;
  final time = '25'.obs;


  void isSwitched(){
    isOtp.value = true;
  }

  @override
  void onInit() {
    super.onInit();
  }

   @override
  void onReady() {
    _startTimer(25);
    super.onReady();
  }

  @override
  void onClose() {
      _timer!.cancel();
    super.onClose();
  }

  _startTimer(int seconds) {
    const duration = Duration(seconds: 1);
    remainingSeconds = seconds;
    _timer = Timer.periodic(duration, (Timer timer) {
      if (remainingSeconds == 0) {
        timer.cancel();
        isResendEnabled.value = true;
      } else {
        int seconds = (remainingSeconds % 60);
        time.value = "${seconds.toString().padLeft(2, "0")}";
        remainingSeconds--;
      }
    });
  }

  void number(String number){
    phoneNumber.value = number;
  }

  void listen()async{
    await SmsAutoFill().listenForCode();
    await SmsAutoFill().getAppSignature;
  }


  
  @override
  void codeUpdated() {
    otpCode.value = code!;
  }



   void resendOTP() {
    isResendEnabled.value = false; 
    _startTimer(25); 
  }


}