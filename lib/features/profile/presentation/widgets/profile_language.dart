import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tdmc_project/core/dependancy_injection/injection.dart';
import 'package:tdmc_project/core/utils/app_colors.dart';
import 'package:tdmc_project/core/utils/app_images.dart';
import 'package:tdmc_project/core/utils/app_radius.dart';
import 'package:tdmc_project/core/utils/app_size.dart';
import 'package:tdmc_project/features/profile/logic/profile_cubit.dart';
import '../../../../core/widgets/custom_buttons.dart';

class ProfileLanguage extends StatelessWidget {
  const ProfileLanguage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ProfileCubit>(),
      child: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          var cubit = ProfileCubit.get(context);
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: BuildContainer(
                      icon: AppImages.arabic,
                      txt: 'profile.arabic'.tr(),
                      onTap: () {
                        cubit.languageSwitch('ar', state);
                      },
                      bgColor: cubit.language == 'ar' ?
                      AppColors.pink : Colors.white,
                      textColor: cubit.language == 'ar' ?
                      Colors.white : Colors.black,
                    ),
                  ),
                  SizedBox(
                    width: AppSize.getHorizontalSize(10),
                  ),
                  Expanded(
                    child: BuildContainer(
                      icon: AppImages.english,
                      txt: 'English',
                      onTap: () {
                        cubit.languageSwitch('en', state);
                      },
                      bgColor: cubit.language == 'en' ? AppColors.pink : Colors
                          .white,
                      textColor: cubit.language == 'en' ? Colors.white : Colors
                          .black,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: AppSize.getVerticalSize(40),
              ),
              CustomDefaultButton(
                  height: AppSize.getVerticalSize(53),
                  onTap: () {
                    cubit.changeLanguage(context, cubit.language,
                        state);
                  },
                  text: 'submit'.tr()),
            ],
          );
        },
      ),
    );
  }
}

class BuildContainer extends StatelessWidget {
  const BuildContainer({super.key,
    required this.icon,
    required this.txt,
    required this.onTap,
    required this.bgColor,
    required this.textColor});

  final String icon;
  final String txt;
  final Color bgColor;
  final Color textColor;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        //height: AppSize.getVerticalSize(48),
        padding: AppSize.padding(vertical: 10, horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: AppRadius.radius30,
          color: bgColor,
        ),
        child: Row(
          children: [
            Image.asset(
              icon,
              /*width: 60,
              height: 48,*/
            ),
            SizedBox(
              width: AppSize.getHorizontalSize(7),
            ),
            Text(
              txt,
              style: TextStyle(
                color: textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
