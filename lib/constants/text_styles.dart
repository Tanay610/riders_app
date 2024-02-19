import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:riders_app/constants/colors.dart';
import 'colors.dart';

class FontStyles{

  static TextStyle medium14P({Color? color}) => GoogleFonts.poppins(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: color ?? AppColors.grey800,
    );


    static TextStyle splashTitle({Color? color}) => GoogleFonts.poppins(
      fontSize: 27.5,
      fontWeight: FontWeight.w600,
      color: color ?? AppColors.black,
    );


    static TextStyle medium600_P14({Color? color}) => GoogleFonts.poppins(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: color ?? AppColors.black,
    );


    static TextStyle medium400P14({Color? color}) => GoogleFonts.poppins(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: color ?? AppColors.black,
    );


    static TextStyle mediumP16({Color? color}) => GoogleFonts.poppins(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: color ?? AppColors.black,
    );


    static TextStyle med400P12({Color? color}) => GoogleFonts.poppins(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: color ?? AppColors.black,
    );



    
}