import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:riders_app/constants/colors.dart';
import 'package:riders_app/constants/text_styles.dart';
import 'package:riders_app/controllers/otp_controller.dart';
import 'package:riders_app/view/pages/profile_page.dart';
import 'package:sms_autofill/sms_autofill.dart';

class OTPForm extends StatefulWidget {
  OTPForm({super.key});

  @override
  State<OTPForm> createState() => _OTPFormState();
}

class _OTPFormState extends State<OTPForm> {
  TextEditingController fieldController = TextEditingController();

  var otpcontroller = Get.put(OtpController());

  @override
  void initState() {
    super.initState();
    otpcontroller.listen();
  }

  @override
  void dispose() {
    SmsAutoFill().unregisterListener();
    super.dispose();
  }

  String code = "1234";

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16, top: 16, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Enter OTP sent to ${otpcontroller.phoneNumber}",
                style: FontStyles.medium14P(color: AppColors.black),
              ),
              TextButton(
                  onPressed: () {
                    otpcontroller.isOtp.value = false;
                  },
                  child: Text(
                    "Change",
                    style: FontStyles.medium14P(color: AppColors.green1000),
                  ))
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Theme(
                data: ThemeData(
                  textSelectionTheme: const TextSelectionThemeData(
                    cursorColor: Colors.transparent,
                  ),
                ),
                child: SizedBox(
                  height: 52,
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: PinFieldAutoFill(
                    autoFocus: true,
                    controller: fieldController,
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.number,
                    // focusNode: FocusNode(),
                    currentCode: "",
                    codeLength: 4,
                    cursor: Cursor(
                      width: 2,
                      height: 40,
                      color: Colors.green,
                      radius: const Radius.circular(1),
                      enabled: true,
                    ),
                    // inputFormatters: [
                    //   LengthLimitingTextInputFormatter(1),
                    //   FilteringTextInputFormatter.digitsOnly,
                    // ],
                    onCodeSubmitted: (code) {},
                    onCodeChanged: (code) {
                      // FocusScope.of(context).requestFocus(FocusNode());
                    },
                    decoration: BoxLooseDecoration(
                        strokeColorBuilder: PinListenColorBuilder(
                            AppColors.green1000, AppColors.justGrey40)),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Obx(
                () => Text(
                  "Resend on ${otpcontroller.time.value}s",
                  style: FontStyles.medium400P14(color: AppColors.justGrey60),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.92,
            height: 48,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.green1000,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)))),
              onPressed: () {
                Get.to(ProfilePage());
              },
              child: Text(
                'Verify OTP',
                style: FontStyles.mediumP16(color: AppColors.justGrey10),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
