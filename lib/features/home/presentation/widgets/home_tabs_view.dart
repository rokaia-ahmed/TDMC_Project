import 'package:flutter/material.dart';
import 'package:tdmc_project/core/utils/app_size.dart';

import 'home_list_item.dart';

class HomeTabsView extends StatelessWidget {
  const HomeTabsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TabBarView(physics: NeverScrollableScrollPhysics(), children: [
        BuildListView(),
        BuildListView(),
        BuildListView(),
      ]),
    );
  }
}

class BuildListView extends StatelessWidget {
  const BuildListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        physics:  BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return HomeListItem();
        },
        separatorBuilder: (context, index) => SizedBox(
              height: AppSize.getVerticalSize(10),
            ),
        itemCount: 10);
  }
}
