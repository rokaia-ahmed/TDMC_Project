import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tdmc_project/core/dependancy_injection/injection.dart';
import 'package:tdmc_project/core/utils/app_size.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/styles.dart';
import '../../../home/logic/home_cubit.dart';
import '../../logic/layout_cubit.dart';


class LayoutScreen extends StatelessWidget {
  const LayoutScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final List<String> navbarNames=[
      'layout.home'.tr(),
      'layout.calendar'.tr(),
      'layout.profile'.tr(),
    ];
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<LayoutCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<HomeCubit>()..getWorkShops(),
        ),
      ],
      child: BlocBuilder<LayoutCubit, LayoutState>(
        builder: (context, state) {
          var cubit = LayoutCubit.get(context);
          return Scaffold(
            resizeToAvoidBottomInset:false,
            body: SafeArea(
              child: cubit.Screens[cubit.activeIndex],
            ),
            bottomNavigationBar:
            AnimatedBottomNavigationBar.builder(
              height: AppSize.getVerticalSize(65),
              activeIndex: cubit.activeIndex,
              gapLocation: GapLocation.none,
              onTap: (index) {
                cubit.changeNavbarIndex(index);
              },
              itemCount: cubit.icons.length,
              tabBuilder: (int index, bool isActive) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      cubit.icons[index],
                      width: AppSize.getHorizontalSize(30),
                      height: AppSize.getVerticalSize(30),
                      colorFilter: ColorFilter.mode(
                          isActive ? AppColors.primaryColor : AppColors
                              .gryColor,
                          BlendMode.srcIn),
                    ),
                    SizedBox(
                      height: AppSize.getVerticalSize(3),
                    ),
                    Text(navbarNames[index],
                      style: Styles.textStyle12w700.copyWith(
                        color: isActive ? AppColors.primaryColor : AppColors
                            .gryColor,
                      ),
                    ),
                  ],
                );
              },
              //other params
            ),
          );
        },
      ),
    );
  }
}
