import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:riders_app/constants/colors.dart';
import 'package:riders_app/constants/text_styles.dart';
import 'package:riders_app/controllers/otp_controller.dart';
import 'package:riders_app/controllers/time_controller.dart';
import 'package:riders_app/view/pages/profile_page.dart';
import 'package:sms_autofill/sms_autofill.dart';

class OTPForm extends StatelessWidget{
  OTPForm({super.key});

  var controller = Get.put(TimerController());
  // var otpcontroller = Get.put(OtpController());


  String? appSignature;
  String? otpCode;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min ,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16, top: 16),
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
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: 52,
                width: 52,
                child: TextFormField(
                  onChanged: (value) {
                      // otpcontroller.codeUpdated();
                      // value = otpcontroller!.code;
                    if (value.length == 1) {
                      FocusScope.of(context).nextFocus();
                    }
                  },
                  keyboardType: TextInputType.number,
                  onSaved: (pin1) {},
                  decoration: const InputDecoration(
                      // fillColor: Color(0xFFF4F4F4),
                      // filled: true,
                      border: InputBorder.none,
                      disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.justGrey40),
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                      focusedBorder: OutlineInputBorder(
                        
                        borderSide: BorderSide(color: AppColors.green1000, ),
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
                    //   otpcontroller.codeUpdated();
                    // value = otpcontroller!.code;
                    if (value.length == 1) {
                      FocusScope.of(context).nextFocus();
                    }
                  },
                  keyboardType: TextInputType.number,
                  onSaved: (pin1) {},
                  decoration: const InputDecoration(
                      // fillColor: Color(0xFFF4F4F4),
                      // filled: true,
                      border: InputBorder.none,
                      disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.justGrey40),
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                      focusedBorder: OutlineInputBorder(
                        
                        borderSide: BorderSide(color: AppColors.green1000),
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
                    //   otpcontroller.codeUpdated();
                    if (value.length == 1) {
                      FocusScope.of(context).nextFocus();
                    }
                  },
                  keyboardType: TextInputType.number,
                  onSaved: (pin1) {},
                  decoration: const InputDecoration(
                      // fillColor: Color(0xFFF4F4F4),
                      // filled: true,
                      border: InputBorder.none,
                      disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.justGrey40),
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                      focusedBorder: OutlineInputBorder(
                        
                        borderSide: BorderSide(color: AppColors.green1000),
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
                    //   otpcontroller.codeUpdated();
                    // value = otpcontroller!.code;
                    if (value.length == 1) {
                      FocusScope.of(context).nextFocus();
                    }
                  },
                  keyboardType: TextInputType.number,
                  onSaved: (pin1) {},
                  decoration: const InputDecoration(
                      // fillColor: Color(0xFFF4F4F4),
                      // filled: true,
                      border: InputBorder.none,
                      
                  disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.justGrey40),
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color:AppColors.green1000 ),
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
          padding: const EdgeInsets.symmetric( horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Obx(()=>
                Text(
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
                  shape: RoundedRectangleBorder(
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
