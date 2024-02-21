import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart' hide Trans;
import 'package:riders_app/constants/colors.dart';
import 'package:riders_app/constants/text_styles.dart';
import 'package:riders_app/controllers/otp_controller.dart';
import 'package:riders_app/utils/get_string.dart';
import 'package:riders_app/view/components/custom_color_builder.dart';
import 'package:riders_app/view/pages/profile_page.dart';
import 'package:sms_autofill/sms_autofill.dart';

class OTPForm extends GetView<OtpController> {
  OTPForm({super.key});

  TextEditingController fieldController = TextEditingController();
 
  bool isFocus = false;

  Color strokeColor = AppColors.justGrey40;
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
                "${getString("enter_otp_sent_to")} ${controller.phoneNumber}",
                style: FontStyles.medium14P(color: AppColors.black),
              ),
              TextButton(
                  onPressed: () {
                    controller.isOtp.value = false;
                  },
                  child: Text(
                    getString("change"),
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
                        selectionHandleColor: Colors.transparent,
                        selectionColor: Colors.transparent,
                      ),
                    ),
                    child: SizedBox(
                      height: 52,
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: PinFieldAutoFill(
                        autoFocus: true,
                        enableInteractiveSelection: false,
                        controller: fieldController,
                        textInputAction:TextInputAction.done,
                        keyboardType: TextInputType.number,
                        focusNode: controller.focusNode,
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
                        onCodeSubmitted: (code) {
                          
                        },
                        onCodeChanged: (code) {
                          // FocusScope.of(context).requestFocus(FocusNode());
                        },
                        decoration: BoxLooseDecoration(
                            strokeColorBuilder:PinListenColorBuilder(AppColors.green1000, AppColors.justGrey40)),
                      ),
                    ),
                  ),
              ],
            ),
          ),

          //FixedColorBuilder(controller.hasFocus.value?AppColors.green1000:AppColors.justGrey40)
        
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Obx(
                () => controller.isResendEnabled.value?SizedBox():Text(
                  "${getString("resend")} ${controller.time.value}s",
                  style: FontStyles.medium400P14(color: AppColors.justGrey60),
                ),
              ),
                 Obx(
              () => controller.isResendEnabled.value
                  ? TextButton(
                      onPressed: controller.resendOTP,
                      child: Text("${getString("resend_otp")}", style: TextStyle(color: Colors.green)),
                    )
                  : SizedBox.shrink(),
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
                Get.to(()=>ProfilePage());
              },
              child: Text(
                getString("verify"),
                style: FontStyles.mediumP16(color: AppColors.justGrey10),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
