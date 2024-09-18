import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_colors.dart';

class CustomTextStyle {
  static TextStyle labelText = GoogleFonts.montserrat(
      textStyle: TextStyle(fontSize: 12.sp, color: AppColors.primaryColor));

  static TextStyle labelTextUnSelected = GoogleFonts.montserrat(
      textStyle: TextStyle(fontSize: 12.sp, color: AppColors.fontColor));



  static TextStyle errorText = GoogleFonts.montserrat(
      textStyle: TextStyle(fontSize: 12.sp, color: Colors.red));

  static TextStyle labelTextBold = GoogleFonts.montserrat(
      textStyle: TextStyle(fontSize: 14.sp, color: AppColors.primaryColor,
          fontWeight: FontWeight.bold));
}

class CustomText extends StatelessWidget {
  const CustomText(
    this.data, {
    super.key,
    this.color = Colors.white,
    this.fontSize,
    this.height,
    this.letterSpacing,
    this.fontWeight = FontWeight.w400,
    this.textAlign = TextAlign.start,
    this.decoration = TextDecoration.none,
    this.decorationThickness = 1,
    this.decorationStyle,
    this.overflow,
    this.maxLines,
  });

  final String data;
  final Color? color;
  final double? fontSize;
  final double? height;
  final double? letterSpacing;
  final int? maxLines;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final TextDecoration? decoration;
  final double? decorationThickness;
  final TextDecorationStyle? decorationStyle;
  final TextOverflow? overflow;

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      style: GoogleFonts.urbanist(
        color: color,
        fontSize: fontSize ?? 14.sp,
        fontWeight: fontWeight,
        letterSpacing: letterSpacing,
        height: height,
        decoration: decoration,
        decorationColor: color,
        decorationStyle: decorationStyle,
        decorationThickness: decorationThickness,
      ),
    );
  }
}
