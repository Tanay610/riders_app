import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:riders_app/constants/colors.dart';
import 'package:riders_app/constants/text_styles.dart';

class OTPForm extends StatelessWidget {
  const OTPForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min ,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric( horizontal: 14),
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
