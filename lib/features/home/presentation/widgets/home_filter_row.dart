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
        Text('Workshops',
          style: Styles.textStyle24w600,
        ),
        BlocBuilder<HomeCubit,HomeState>(
          builder: (context, state) {
            var cubit =  HomeCubit.get(context);
            return InkWell(
              onTap:cubit.searchList.isNotEmpty?() {
                cubit.clearSearch();
              }:null,
              child: Text('Rest Filter',
                style: Styles.textStyle16w600.copyWith(
                  color: (cubit.searchList.isNotEmpty)?
                  AppColors.primaryColor:AppColors.gryTextColor3,
                  decoration: TextDecoration.underline,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
