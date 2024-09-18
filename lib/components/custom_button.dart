import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/app_colors.dart';


//Simple common button class
class CustomButton extends StatelessWidget {
  final String title;
  final Function()? onClick;
  final Color? buttonColor;
  final Color? fontColor;

  const CustomButton({Key? key, required this.title, this.onClick, this.buttonColor, this.fontColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: ElevatedButton(
            onPressed: onClick,
            clipBehavior: Clip.hardEdge,
            style: ElevatedButton.styleFrom(backgroundColor: buttonColor ?? AppColors.primaryColor,
                splashFactory: NoSplash.splashFactory,
                shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0)))),
            child: Text(title, style: GoogleFonts.montserrat(
              fontWeight: FontWeight.normal,
              fontSize: 14.sp,
              color: fontColor
            ))),
      );
  }
}

//Border button class
class BorderButton extends StatelessWidget {
  final String btnString;
  final Function()? onClick;

  const BorderButton({Key? key, required this.btnString, this.onClick}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(AppColors.primaryColor),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    side: BorderSide(color: AppColors.primaryColor, width: 2)))),
        onPressed: onClick,
        child: Text(btnString, style: GoogleFonts.roboto(
            fontWeight: FontWeight.w600,
            fontSize: 14.sp,
            color: AppColors.primaryColor
        )));
  }
}
