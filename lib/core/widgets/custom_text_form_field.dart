import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import '../utils/app_colors.dart';
import '../utils/app_constants.dart';
import '../utils/app_radius.dart';
import '../utils/app_size.dart';
import '../utils/styles.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.hint,
    this.onTap,
    this.validator,
    this.suffixColor,
    this.prefixColor,
    this.minLines = 1,
    this.maxLines = 1,
    this.enabled = true,
    this.inputFormatters,
    required this.controller,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.textDirection,
    this.textAlign,
    this.readOnly=false,
    this.fillColor,
    this.prefixIcon,
    this.suffixIcon, this.codeWidget, this.suffixOnTap, this.suffix,
  });

  final TextInputType keyboardType;
  final TextEditingController controller;

  final String? hint;
  final TextDirection? textDirection;
  final TextAlign? textAlign;

  final Widget? codeWidget;
  final String? prefixIcon;
  final Color? prefixColor;
  final Color? fillColor;

  final Widget? suffixIcon;
  final Widget? suffix;
  final Color? suffixColor;

  final int minLines;
  final int maxLines;

  final bool enabled;
  final bool readOnly;
  final bool obscureText;
  final Function()? onTap;
  final Function()? suffixOnTap;
  final FormFieldValidator<String>? validator;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSize.getVerticalSize(54),
      child: TextFormField(
        onTap: onTap,
        enabled: enabled,
        minLines: minLines,
        maxLines: maxLines,
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,
        inputFormatters: inputFormatters,
        cursorColor: AppColors.primaryColor,
        validator: validator ?? (val) => null,
        textDirection: textDirection,
        textAlign: textAlign ?? TextAlign.start,
       readOnly: readOnly,
        style: TextStyle(fontSize: AppSize.fontSize(16),
          decorationThickness: 0
        ),
        decoration: InputDecoration(
          fillColor:fillColor?? Colors.white ,
          filled:true,
          /// HINT
          hintText: hint,
          hintStyle: Styles.textStyle16w400.copyWith(
            color: AppColors.hintTextGry,
          ),
          prefix:codeWidget ,
          /// prefix
          prefixIconColor: prefixColor,
          prefixIconConstraints:BoxConstraints(
            minHeight:AppSize.getVerticalSize(20),
            minWidth: AppSize.getHorizontalSize(20),
          ) ,
          prefixIcon:prefixIcon !=null? Padding(
            padding: AppSize.padding(horizontal: 5),
            child: SvgPicture.asset(prefixIcon!,
              height:AppSize.getVerticalSize(30),
              width: AppSize.getHorizontalSize(25),
            ),
          ):null,
          /// suffix
          suffixIconConstraints:BoxConstraints(
            minHeight:AppSize.getVerticalSize(20),
            minWidth: AppSize.getHorizontalSize(20),
          ) ,
          suffixIconColor: suffixColor,
          suffixIcon:
          InkWell(
            onTap: suffixOnTap,
              child:Padding(
                padding: AppSize.padding(horizontal: 5),
                child: suffixIcon,
              ),
          ),
          errorStyle:const TextStyle(
            height: 0.5,
            fontSize: 11,
            color: Colors.red
          ) ,
          border: AppConstants.defaultBorder,
          enabledBorder: AppConstants.defaultBorder,
          focusedBorder:AppConstants.defaultBorder.copyWith(
            borderSide: const BorderSide(
              color:AppColors.primaryColor ,
            ),
          ),
          errorBorder:OutlineInputBorder(
            borderRadius: AppRadius.radius10,
            borderSide: const BorderSide(
              color: AppColors.red,
            ),
          ),
          contentPadding: const EdgeInsets.all(10),
        ),
      ),
    );
  }
}

