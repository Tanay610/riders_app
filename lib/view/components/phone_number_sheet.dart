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
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                child: Text(
                  'Login or Sign Up',
                  style: FontStyles.medium14P(color: AppColors.grey800),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SizedBox(
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
                  prefixIcon: Container(
                    margin: EdgeInsets.only(top: 5, bottom: 5),
                    height: 15,
                    decoration: BoxDecoration(
                      border: Border(right: BorderSide(color: AppColors.justGrey40, ))
                    ),
                    
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(
                        "+91",
                        textAlign: TextAlign.center,
                        style:
                            FontStyles.medium600_P14(color: AppColors.justGrey100),
                      ),
                    ),
                  ),
                  prefix: VerticalDivider(
                    color: Colors.black,
                    width: 10,
                    thickness: 1.0,
                    endIndent: 15,
                    indent: 5,
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
          ),
          SizedBox(height: 16.0),
          Obx(
            () => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SizedBox(
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
          ),
          
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Row(
              children: [
                Text('By continuing you agree to ',
                    style: FontStyles.med400P12(color: AppColors.justGrey60)),
                Text(
                  "Terms and conditions",
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColors.justGrey60,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
