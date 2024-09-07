import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/styles.dart';
import '../../logic/home_cubit.dart';

class HomeFilterRow extends StatelessWidget {
  const HomeFilterRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('home.workshops'.tr(),
          style: Styles.textStyle22w700,
        ),
        BlocBuilder<HomeCubit,HomeState>(
          builder: (context, state) {
            var cubit =  HomeCubit.get(context);
            return InkWell(
              onTap:(cubit.searchList.isNotEmpty)?() {
                cubit.clearSearch();
              }:null,
              child: Text('home.rest_filter'.tr(),
                style: Styles.textStyle16w600.copyWith(
                  color: (cubit.searchList.isNotEmpty)?
                  AppColors.primaryColor:AppColors.gryTextColor3,
                  decoration: TextDecoration.underline,
                  decorationColor:(cubit.searchList.isNotEmpty)?
                  AppColors.primaryColor: AppColors.gryTextColor3,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
