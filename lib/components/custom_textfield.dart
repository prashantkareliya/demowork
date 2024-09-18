import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/custom_text_styles.dart';
import '../utils/app_colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      this.hint,
      required this.controller,
      this.keyboardType,
      this.errorText,
      this.titleText,
      this.onEditingComplete,
      this.onChange,
      required this.readOnly,
      this.onTap,
      this.inputFormatters,
      this.validator,
      this.isRequired,
      required this.obscureText,
      this.suffixWidget,
      this.copyWidget,
      this.prefixIcon,
      this.maxLength,
      this.maxLines,
      this.minLines,
      this.star,
      this.color,
      this.textInputAction,
      this.fillColor,
      this.labelText});

  final String? hint;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final String? errorText;
  final String? titleText;
  final Function()? onEditingComplete;
  final void Function(String)? onChange;
  final bool readOnly;
  final bool obscureText;
  final Function()? onTap;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String? val)? validator;
  final bool? isRequired;
  final Widget? suffixWidget;
  final Widget? copyWidget;
  final Widget? prefixIcon;
  final int? maxLength;
  final int? maxLines;
  final int? minLines;
  final String? star;
  final TextInputAction? textInputAction;
  final Color? color;
  final Color? fillColor;
  final String? labelText;


  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 8.h),
        TextFormField(
            controller: controller,
            style: GoogleFonts.roboto(
                textStyle: TextStyle(
                    fontSize: 12.sp,
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.w500)),
            textCapitalization: TextCapitalization.sentences,
            inputFormatters: inputFormatters,
            textInputAction: textInputAction,
            maxLines: maxLines,
            minLines: minLines,
            maxLength: maxLength,
            readOnly: readOnly,
            onTap: onTap,
            autofocus: false,
            obscureText: obscureText,
            onEditingComplete: onEditingComplete,
            onChanged: onChange,
            keyboardType: keyboardType,
            cursorColor: AppColors.primaryColor,
            decoration: InputDecoration(
              errorStyle: CustomTextStyle.errorText,
              suffixIcon: suffixWidget,
              prefixIcon: prefixIcon,

              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide:
                    BorderSide(color: AppColors.primaryColor, width: 0.5),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide:
                    BorderSide(color: AppColors.primaryColor, width: 0.5),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide:
                    BorderSide(color: AppColors.primaryColor, width: 0.5),
              ),
              filled: true,
              fillColor: fillColor ?? AppColors.whiteColor,
              contentPadding:
                  EdgeInsets.symmetric(vertical: 0.sp, horizontal: 18.sp),
              hintText: hint,
              hintStyle: CustomTextStyle.labelText,
              counterText: "",
              labelStyle: GoogleFonts.roboto(
                  textStyle: TextStyle(
                      fontSize: 14.sp,
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.normal)),

              //    labelText: "${titleText!}${star ?? ""}"

            ),

            validator: (validator != null)
                ? validator
                : (isRequired == true)
                    ? (String? val) {
                        if (val?.isEmpty == true) {
                          return "${titleText ?? 'This field'} can't empty";
                        } else {
                          return null;
                        }
                      }
                    : null),
        SizedBox(height: 4.h),
      ],
    );
  }
}
