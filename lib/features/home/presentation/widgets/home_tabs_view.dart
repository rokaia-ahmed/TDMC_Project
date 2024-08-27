import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tdmc_project/core/utils/app_size.dart';
import 'package:tdmc_project/features/home/logic/home_cubit.dart';
import '../../../../core/utils/app_navigation.dart';
import '../../../../core/widgets/custom_error_widget.dart';
import '../screens/details_screen.dart';
import 'home_list_item.dart';

class HomeTabsView extends StatelessWidget {
  const HomeTabsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit,HomeState>(
      builder: (context, state) {
       var cubit = HomeCubit.get(context);
        if(state is Loading){
         return Center(child: CircularProgressIndicator());
       }else if(state is Error){
         return CustomErrorWidget(error: state.errorMsg,);
       } else if(state is Success ||state is SearchSuccess){
         return Expanded(
           child: TabBarView(
             physics: NeverScrollableScrollPhysics(),
             children: [
               BuildListView(list: cubit.searchList.isNotEmpty? cubit.searchList:
               cubit.workShopsModel!.enrolledWorkshops!,),
               BuildListView(list:cubit.searchList.isNotEmpty? cubit.searchList:
               cubit.workShopsModel!.completedWorkshops!,),
               BuildListView(list:cubit.searchList.isNotEmpty?
               cubit.searchList: cubit.workShopsModel!.upcomingWorkshops!,),
               BuildListView(list:cubit.searchList.isNotEmpty?
               cubit.searchList: cubit.workShopsModel!.invitedWorkshops!,),
             ],
           ),
         );
       }else if(state is SearchError){
          return CustomErrorWidget(error: state.errorMsg,);
        } else{
         return Container() ;
       }
      },
    );
  }
}

class BuildListView extends StatelessWidget {
  const BuildListView({super.key, required this.list});
  final List list ;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        physics: AlwaysScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return HomeListItem(
            onTap: () {
            AppNavigator.push(
                screen: DetailsScreen(
                  model:list[index],
                ),
                context: context);
          },
            model:list[index],
          );
        },
        separatorBuilder: (context, index) =>
            SizedBox(
              height: AppSize.getVerticalSize(15),
            ),
        itemCount: list.length);
  }
}
