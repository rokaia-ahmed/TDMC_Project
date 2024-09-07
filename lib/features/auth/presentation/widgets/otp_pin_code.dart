import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:tdmc_project/core/network/local/cache/cache_helper.dart';
import 'package:tdmc_project/core/utils/app_radius.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_size.dart';
import '../../../../core/utils/styles.dart';

class OtpPinCode extends StatelessWidget {
  const OtpPinCode({super.key, required this.controller,
    this.validator, required this.errorTextSpace});
  final TextEditingController controller ;
  final String? Function(String?)? validator ;
  final double errorTextSpace;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppSize.padding(horizontal: 50),
      child: PinCodeTextField(
        length: 4,
        appContext: context,
        obscureText: false,
        errorTextSpace: errorTextSpace,
        cursorColor: AppColors.primaryColor,
        textStyle: Styles.textStyle20w500,
        keyboardType: TextInputType.number,
        enablePinAutofill: true,
        scrollPadding: EdgeInsets.zero,
        errorTextDirection:CacheHelper.getData('lang')=='en'?
        TextDirection.ltr:TextDirection.rtl,
        validator:validator ,
        autovalidateMode:AutovalidateMode.disabled,
        animationDuration: const Duration(milliseconds: 300),
        pinTheme: PinTheme(
          fieldOuterPadding:EdgeInsets.zero,
          shape: PinCodeFieldShape.box,
          borderRadius: AppRadius.radius12,
          activeBorderWidth: 1,
          inactiveBorderWidth: 1,
          selectedBorderWidth: 1,
          errorBorderWidth: 1,
          fieldHeight: AppSize.getVerticalSize(52),
          fieldWidth: AppSize.getHorizontalSize(48),
          errorBorderColor: Colors.red,
          inactiveColor: AppColors.borderColor,
          activeColor: AppColors.borderColor,
          selectedColor: AppColors.primaryColor,
          inactiveFillColor: Colors.white,
          selectedFillColor: Colors.white,
          activeFillColor: Colors.transparent,
        ),
        enableActiveFill: true,
        controller: controller,
      ),
    );
  }
}
