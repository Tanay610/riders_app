
import 'package:get/get.dart';
import 'package:sms_autofill/sms_autofill.dart';

class OtpController extends GetxController with CodeAutoFill{
  RxString? appSignature;
  RxString? otpCode;

  @override
  void onInit() {
    super.onInit();
    listenForCode();

    SmsAutoFill().getAppSignature.then((signature) {
        appSignature!.value = signature;
    });
  }
  
  @override
  void codeUpdated() {
    otpCode!.value = code!;
  }

}