import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tdmc_project/core/dependancy_injection/injection.dart';
import 'package:tdmc_project/core/utils/app_size.dart';
import 'package:tdmc_project/features/home/logic/home_cubit.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/styles.dart';
import '../widgets/layout_app_bar.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HomeCubit>(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          var cubit = HomeCubit.get(context);
          return Scaffold(
            body: SafeArea(
              child: Column(
                children: [
                  /// top app bar
                  LayoutAppBar(),
                  SizedBox(
                    height: AppSize.getVerticalSize(10),
                  ),
                  cubit.Screens[cubit.activeIndex],
                ],
              ),
            ),
            bottomNavigationBar:
            AnimatedBottomNavigationBar.builder(
              height: AppSize.getVerticalSize(85),
              activeIndex: cubit.activeIndex,
              gapLocation: GapLocation.none,
              onTap: (index) {
                cubit.changeNavbarIndex(index);
              },
              itemCount: 2,
              tabBuilder: (int index, bool isActive) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      cubit.icons[index],
                       width: AppSize.getHorizontalSize(35),
                      colorFilter: ColorFilter.mode(
                          isActive ? AppColors.primaryColor :AppColors.gryColor ,
                          BlendMode.srcIn),
                    ),
                    SizedBox(
                      height: AppSize.getVerticalSize(3),
                    ),
                    Text(cubit.navbarNames[index],
                      style: Styles.textStyle12w700.copyWith(
                        color: isActive ? AppColors.primaryColor : AppColors.gryColor,
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
