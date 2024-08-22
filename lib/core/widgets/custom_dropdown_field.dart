import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../utils/app_colors.dart';
import '../utils/app_constants.dart';
import '../utils/app_radius.dart';
import '../utils/app_size.dart';
import '../utils/styles.dart';

class CustomDropdownField extends StatelessWidget {
  const CustomDropdownField({
    super.key,
    this.value,
    this.items,
    this.validator,
    required this.hitText,
    required this.onChanged,
    this.onTap,
    this.hitColor,
    this.iconColor,
    this.prefixIcon,
    this.suffixIcon,
  });

  final String hitText;
  final Color? hitColor;
  final Color? iconColor;
  final String? prefixIcon;
  final String? suffixIcon;
  final dynamic value;
  final Function(dynamic) onChanged;
  final Function()? onTap;
  final List<DropdownMenuItem<Object>>? items;
  final FormFieldValidator<dynamic>? validator;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSize.getVerticalSize(54),
      child: ButtonTheme(
        alignedDropdown: true,
        child: DropdownButtonFormField(
          value: value,
          items: items,
          onTap: onTap,
          borderRadius:BorderRadius.zero ,
          iconDisabledColor: Colors.white,
         // icon: const Icon(Icons.keyboard_arrow_down_sharp),
          alignment:AlignmentDirectional.centerStart,
          decoration: InputDecoration(
            hintText: hitText,
            hintStyle: Styles.textStyle16w400.copyWith(
              color: AppColors.hintTextGry,
            ),
            filled: true,
            fillColor: Colors.white,

            contentPadding:AppSize.padding(top: 10,bottom: 60,end: 10),
            /// prefix
            prefixIconConstraints:BoxConstraints(
              minHeight:AppSize.getVerticalSize(30),
              minWidth: AppSize.getHorizontalSize(30),
            ) ,
            prefixIcon:prefixIcon !=null? SvgPicture.asset(prefixIcon!,):null,
            /// suffix
            suffixIconConstraints:BoxConstraints(
              minHeight:AppSize.getVerticalSize(30),
              minWidth: AppSize.getHorizontalSize(30),
            ) ,
            suffixIcon: suffixIcon !=null? SvgPicture.asset(suffixIcon!):null,
            errorStyle:const TextStyle(
              height: 0.2,
              color: Colors.red,
            ) ,
            errorBorder:OutlineInputBorder(
                borderRadius: AppRadius.radius20,
                borderSide: const BorderSide(
                  color: AppColors.red,
                ),
            ),
            border:AppConstants.defaultBorder,
            enabledBorder:AppConstants.defaultBorder,
            focusedBorder: AppConstants.defaultBorder.copyWith(
              borderSide: const BorderSide(
                color:AppColors.primaryColor ,
              ),
            ),
          ),
          validator: validator ,
          onChanged: (dynamic val) => onChanged(val),
        ),
      ),
    );
  }
}
