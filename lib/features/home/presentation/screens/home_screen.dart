import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tdmc_project/core/utils/app_size.dart';
import 'package:tdmc_project/features/home/logic/home_cubit.dart';
import 'package:tdmc_project/features/home/presentation/widgets/home_search_field.dart';
import '../../../layout/presentation/widgets/layout_app_bar.dart';
import '../widgets/home_filter_row.dart';
import '../widgets/home_tabs_bar.dart';
import '../widgets/home_tabs_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Padding(
        padding: AppSize.padding(all: 15),
        child: BlocBuilder<HomeCubit,HomeState>(
          builder: (context, state) {
            return Column(
              children: [
                /// app bar
                LayoutAppBar(),
                SizedBox(
                  height: AppSize.getVerticalSize(15),
                ),
                /// search text field
                HomeSearchField(),
                SizedBox(
                  height: AppSize.getVerticalSize(20),
                ),

                /// filter row
                HomeFilterRow(),
                SizedBox(
                  height: AppSize.getVerticalSize(20),
                ),

                /// taps bar
                HomeTabsBar(),
                if(state is !Error && state is !SearchError)
                SizedBox(
                  height: AppSize.getVerticalSize(20),
                ),

                /// taps bar view
                HomeTabsView(),
              ],
            );
          },
        ),
      ),
    );
  }
}
