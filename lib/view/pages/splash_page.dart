import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:riders_app/constants/colors.dart';
import 'package:riders_app/controllers/splash_controller.dart';
import 'package:riders_app/view/components/otp_sheet.dart';
import 'package:riders_app/view/components/phone_number_sheet.dart';

import '../../constants/text_styles.dart';

class SplashPage extends StatelessWidget {
  SplashPage({super.key});

  var controller = Get.put(SplashCOntroller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.green1000,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              child: SvgPicture.asset(
                "assets/images/bike.svg",
                height: 34,
              ),
            ),
            GestureDetector(
              onTap: () {
                _showPhoneNumberBottomSheet(context);
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 14),
                child: Text(
                  "Riders App",
                  style: FontStyles.splashTitle(color: AppColors.sTitleColor),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showPhoneNumberBottomSheet(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return Obx(
          () => Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: controller.isOtp.value
                  ? OTPForm()
                  : R_BottomSheet(
                      onNextPressed: controller.isSwitched,
                    )),
        );
      },
    );
  }
}
