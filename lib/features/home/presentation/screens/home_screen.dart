import 'package:flutter/material.dart';
import 'package:tdmc_project/core/utils/app_size.dart';
import 'package:tdmc_project/features/home/presentation/widgets/home_search_field.dart';
import '../widgets/home_filter_row.dart';
import '../widgets/home_tabs_bar.dart';
import '../widgets/home_tabs_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Expanded(
        child: Padding(
          padding: AppSize.padding(all: 10),
          child: Column(
            children: [
              /// search text field
              HomeSearchField(),
              SizedBox(height: AppSize.getVerticalSize(25),),
              /// filter row
              HomeFilterRow(),
              SizedBox(height: AppSize.getVerticalSize(20),),
              /// taps bar
              HomeTabsBar(),
              SizedBox(height: AppSize.getVerticalSize(20),),
              /// taps bar view
              HomeTabsView()
            ],
          ),
        ),
      ),
    );
  }
}
