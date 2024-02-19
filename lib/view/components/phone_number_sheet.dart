
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:riders_app/constants/colors.dart';
import 'package:riders_app/controllers/splash_controller.dart';

import '../../constants/text_styles.dart';

class R_BottomSheet extends StatelessWidget {
  R_BottomSheet({
    super.key,
    required this.onNextPressed,
  });
  final VoidCallback onNextPressed;
  var controller = Get.put(SplashCOntroller());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: Text(
                  'Login or Sign Up',
                  style: FontStyles.medium14P(color: AppColors.grey800),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 12,
          ),
          SizedBox(
            child: TextField(
              autofocus: true,
              keyboardType: TextInputType.phone,
              onTap: () {
                controller.isTextFieldFocused.value = true;
              },
              onEditingComplete: () {
                controller.isTextFieldFocused.value = false;
              },
              decoration: InputDecoration(
                prefix: VerticalDivider(
                  thickness: 1.0,
                  color: AppColors.black,
                  width: 10,
                  indent: 0.1,
                  endIndent: 1,
                ),
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(top: 13),
                  child: Text(
                    "+91",
                    textAlign: TextAlign.center,
                    style:
                        FontStyles.medium600_P14(color: AppColors.justGrey100),
                  ),
                ),
                hintText: 'Enter mobile number',
                disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.justGrey40),
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    borderSide: BorderSide(color: AppColors.green1000)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    borderSide: BorderSide(color: AppColors.justGrey40)),
              ),
            ),
          ),
          SizedBox(height: 16.0),
          Obx(
            () => SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              height: 48,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: controller.isTextFieldFocused.value
                        ? AppColors.green1000
                        : AppColors.justGrey20,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)))),
                onPressed: onNextPressed,
                child: Text(
                  'Continue',
                  style: controller.isTextFieldFocused.value
                      ? FontStyles.mediumP16(color: AppColors.justGrey10)
                      : FontStyles.mediumP16(color: AppColors.justGrey60),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Text('By continuing you agree to Terms and conditions',
              style: FontStyles.med400P12(color: AppColors.justGrey60)),
        ],
      ),
    );
  }
}

