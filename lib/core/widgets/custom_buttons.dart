import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../utils/app_colors.dart';
import '../utils/app_constants.dart';
import '../utils/app_radius.dart';
import '../utils/app_size.dart';
import '../utils/styles.dart';

class CustomDefaultButton extends StatelessWidget {
  const CustomDefaultButton({
    super.key,
    required this.onTap,
    required this.text,
    this.width, this.height,
     this.loading});

  final Function() onTap ;
  final String text  ;
  final double? width  ;
  final double? height  ;
  final bool? loading ;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onTap,
      elevation:0.0,
      height:height?? AppSize.getVerticalSize(50),
      minWidth:width?? double.infinity,
      color: loading==true? AppColors.borderColor:
      AppColors.primaryColor,
      shape: AppConstants.dialogShape,
      child:loading==true?
          const CircularProgressIndicator():
      Text(text,
        style: Styles.textStyle16w400.copyWith(
          color: AppColors.white,
        ),
      ),
    );
  }
}
///////////////////////////////////////////
class CustomButtonWithIcon extends StatelessWidget {
  const CustomButtonWithIcon({
    super.key,
    required this.onTap,
    required this.text,
    this.width, this.height,
    required this.icon,
    this.bgColor,
    this.textColor,
    this.borderSide});

  final Function() onTap ;
  final String text  ;
  final double? width  ;
  final double? height  ;
  final Widget icon  ;
  final Color? bgColor  ;
  final Color? textColor  ;
  final BorderSide? borderSide  ;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onTap,
      elevation: 0.0,
     materialTapTargetSize:MaterialTapTargetSize.shrinkWrap ,
      height:height?? AppSize.getVerticalSize(40),
      minWidth:width?? double.infinity,
      color:bgColor?? AppColors.primaryColor,
      shape: OutlineInputBorder(
        borderSide:borderSide?? BorderSide.none,
        borderRadius:AppRadius.radius20,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon,
         /* SizedBox(
            width: AppSize.getHorizontalSize(2),
          ),*/
          Text(text,
            style: Styles.textStyle14w400.copyWith(
              color: textColor?? AppColors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

////////////////////////////////////////////
class CustomUploadImagesButton extends StatelessWidget {
  const CustomUploadImagesButton({super.key, required this.onTap, this.borderColor});
  final Function() onTap ;
  final Color? borderColor ;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed:onTap,
      height:AppSize.getVerticalSize(50) ,
      minWidth: double.infinity,
      shape: OutlineInputBorder(
        borderRadius: AppRadius.radius20,
        borderSide:  BorderSide(
          color:borderColor?? AppColors.borderColor,
        ),
      ),
      child:SvgPicture.asset(''),
    );
  }
}
////////////////////////////////////////////
class CustomBorderButton extends StatelessWidget {
  const CustomBorderButton({super.key,
    this.width,
    required this.onTap,
    required this.title, this.height});

  final double? width ;
  final double? height ;
  final Function() onTap ;
  final String title ;
  @override
  Widget build(BuildContext context) {
    return  MaterialButton(
      minWidth:width ?? double.infinity,
      height:height?? AppSize.getVerticalSize(45),
      onPressed: onTap,
      shape: OutlineInputBorder(
        borderRadius: AppRadius.radius20,
        borderSide: const BorderSide(
          color: AppColors.primaryColor,
        ),
      ),
      child:  Text(title,
        style:Styles.textStyle16w400.copyWith(
          color: AppColors.primaryColor,
          fontWeight: FontWeight.w700,
        ) ,
      ),
    );
  }
}

