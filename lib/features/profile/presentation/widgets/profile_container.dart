import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tdmc_project/core/utils/app_colors.dart';
import 'package:tdmc_project/core/utils/app_radius.dart';
import 'package:tdmc_project/core/utils/app_size.dart';
import '../../../../core/utils/styles.dart';

class ProfileContainer extends StatelessWidget {
  const ProfileContainer({super.key,
    required this.title,
    required this.subTitle,
    required this.icon});
  final  String title ;
  final  String subTitle ;
  final  String icon ;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: AppRadius.radius30,
        color: Colors.white,
      ),
      padding:AppSize.padding(all: 15),
      child:Row(
        children: [
          SvgPicture.asset(icon),
          SizedBox(
            width:AppSize.getHorizontalSize(20),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                style: Styles.textStyle10w600.copyWith(
                  color: AppColors.gryTextColor6,
                 // fontWeight: FontWeight.w400,
                ),
                ),
                SizedBox(
                  height: AppSize.getVerticalSize(5),
                ),
                Text(subTitle,
                  style: Styles.textStyle15w400.copyWith(
                      color: AppColors.gryTextColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
