import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:riders_app/constants/colors.dart';
import 'package:riders_app/constants/text_styles.dart';
import 'package:riders_app/controllers/otp_controller.dart';
import 'package:riders_app/controllers/time_controller.dart';
import 'package:riders_app/view/pages/profile_page.dart';
import 'package:sms_autofill/sms_autofill.dart';

class OTPForm extends StatefulWidget {
  OTPForm({super.key});

  @override
  State<OTPForm> createState() => _OTPFormState();
}

class _OTPFormState extends State<OTPForm> {
  var controller = Get.put(TimerController());

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
                "Enter OTP sent to 827392329",
                style: FontStyles.medium14P(color: AppColors.black),
              ),
              TextButton(
                  onPressed: () {},
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
              SizedBox(
                height: 52,
                width: MediaQuery.of(context).size.width * 0.7,
                child: PinFieldAutoFill(
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.number,
                    focusNode: FocusNode(),
                    currentCode: code,
                    codeLength: 4,
                    cursor: Cursor(
                      width: 2,
                      height: 40,
                      color: Colors.red,
                      radius: Radius.circular(1),
                      enabled: true,
                    ),
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    onCodeSubmitted: (code) {},
                    onCodeChanged: (code) {
                      if (code!.length == 4) {
                        FocusScope.of(context).requestFocus(FocusNode());
                      }
                    },
                    decoration: BoxLooseDecoration(
                        strokeColorBuilder:
                            FixedColorBuilder(AppColors.justGrey40))),
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
                  "Resend on ${controller.time.value}s",
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
