
import 'package:get/get.dart';
import 'package:sms_autofill/sms_autofill.dart';

class OtpController extends GetxController with CodeAutoFill{
  RxString? appSignature;
  RxString otpCode = '1234'.obs;
  
  String signature = "{{ app signature }}";

  @override
  void onInit() {
    super.onInit();
  }

  void listen()async{
    await SmsAutoFill().listenForCode();
    await SmsAutoFill().getAppSignature;
  }
  
  @override
  void codeUpdated() {
    otpCode.value = code!;
  }

}