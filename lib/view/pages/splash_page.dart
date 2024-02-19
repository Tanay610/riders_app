import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:riders_app/constants/colors.dart';
import 'package:riders_app/controllers/splash_controller.dart';

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

class OTPForm extends StatelessWidget {
  const OTPForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min ,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric( horizontal: 10),
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
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: 52,
                width: 52,
                child: TextFormField(
                  onChanged: (value) {
                    if (value.length == 1) {
                      FocusScope.of(context).nextFocus();
                    }
                  },
                  keyboardType: TextInputType.number,
                  onSaved: (pin1) {},
                  decoration: const InputDecoration(
                      fillColor: Color(0xFFF4F4F4),
                      filled: true,
                      border: InputBorder.none,
                      focusedBorder: OutlineInputBorder(
                        
                        borderSide: BorderSide(color: AppColors.justGrey40, ),
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        
                        borderSide: BorderSide(color: AppColors.justGrey40),
                          borderRadius: BorderRadius.all(Radius.circular(8)))),
                  textAlign: TextAlign.center,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(1),
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                ),
              ),
              SizedBox(
                height: 52,
                width: 52,
                child: TextFormField(
                  onChanged: (value) {
                    if (value.length == 1) {
                      FocusScope.of(context).nextFocus();
                    }
                  },
                  keyboardType: TextInputType.number,
                  onSaved: (pin1) {},
                  decoration: const InputDecoration(
                      fillColor: Color(0xFFF4F4F4),
                      filled: true,
                      border: InputBorder.none,
                      focusedBorder: OutlineInputBorder(
                        
                        borderSide: BorderSide(color: AppColors.justGrey40),
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      enabledBorder: OutlineInputBorder(
                        
                        borderSide: BorderSide(color: AppColors.justGrey40),
                          borderRadius: BorderRadius.all(Radius.circular(8)))),
                  textAlign: TextAlign.center,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(1),
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                ),
              ),
              SizedBox(
                height: 52,
                width: 52,
                child: TextFormField(
                  onChanged: (value) {
                    if (value.length == 1) {
                      FocusScope.of(context).nextFocus();
                    }
                  },
                  keyboardType: TextInputType.number,
                  onSaved: (pin1) {},
                  decoration: const InputDecoration(
                      fillColor: Color(0xFFF4F4F4),
                      filled: true,
                      border: InputBorder.none,
                      focusedBorder: OutlineInputBorder(
                        
                        borderSide: BorderSide(color: AppColors.justGrey40),
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      enabledBorder: OutlineInputBorder(
                        
                        borderSide: BorderSide(color: AppColors.justGrey40),
                          borderRadius: BorderRadius.all(Radius.circular(8)))),
                  textAlign: TextAlign.center,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(1),
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                ),
              ),
              SizedBox(
                height: 52,
                width: 52,
                child: TextFormField(
                  onChanged: (value) {
                    if (value.length == 1) {
                      FocusScope.of(context).nextFocus();
                    }
                  },
                  keyboardType: TextInputType.number,
                  onSaved: (pin1) {},
                  decoration: const InputDecoration(
                      fillColor: Color(0xFFF4F4F4),
                      filled: true,
                      border: InputBorder.none,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color:AppColors.justGrey40 ),
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.justGrey40),
                          borderRadius: BorderRadius.all(Radius.circular(8)))),
                  textAlign: TextAlign.center,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(1),
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Resend in 25s",
                style: FontStyles.medium400P14(color: AppColors.justGrey60),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            height: 48,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.green1000,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)))),
              onPressed: () {},
              child: Text(
                'Verufy OTP',
                style: FontStyles.mediumP16(color: AppColors.justGrey10),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
