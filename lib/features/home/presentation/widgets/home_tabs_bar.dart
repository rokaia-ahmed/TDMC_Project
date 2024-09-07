import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tdmc_project/core/network/local/cache/cache_helper.dart';
import 'package:tdmc_project/features/home/logic/home_cubit.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_size.dart';
import '../../../../core/utils/styles.dart';

class HomeTabsBar extends StatelessWidget {
  const HomeTabsBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit,HomeState>(
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        return Align(
          alignment:CacheHelper.getData('lang')=='en'?
          Alignment.topLeft:Alignment.topRight,
          child: ButtonsTabBar(
            unselectedBackgroundColor: Colors.white,
            backgroundColor: AppColors.primaryColor,
            labelStyle: Styles.textStyle12w600.copyWith(
              color: Colors.white,
            ),
            onTap: (int index) {
              var error = state is Error ?state.errorMsg:'';
              cubit.onChangeTabBarIndex(index,error);
            },
            unselectedLabelStyle: Styles.textStyle12w600.copyWith(
              color: AppColors.primaryColor,
            ),
            radius: 10,
            physics:AlwaysScrollableScrollPhysics(),
            buttonMargin: EdgeInsets.only(
                right:CacheHelper.getData('lang')=='en'? 20:0,
                left:CacheHelper.getData('lang')=='ar'? 20:0),
            splashColor: AppColors.primaryColor.withOpacity(0.2),
            contentCenter: true,
            contentPadding: EdgeInsets.symmetric(horizontal: 10),
            height: AppSize.getVerticalSize(37),
            tabs: [
              Tab(text: 'home.enrolled'.tr()),
              Tab(text: 'home.completed'.tr()),
              Tab(text: 'home.upcoming'.tr()),
              Tab(text: 'home.invitations'.tr()),
            ],
          ),
        );
      },
    );
  }
}


