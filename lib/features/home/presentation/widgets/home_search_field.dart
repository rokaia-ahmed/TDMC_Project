import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../logic/home_cubit.dart';

class HomeSearchField extends StatelessWidget {
  const HomeSearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit,HomeState>(
      builder: (context, state) {
       var cubit =  HomeCubit.get(context);
        return CustomTextField(
          onChanged:(value){
            var error = state is Error ?state.errorMsg:'';
            cubit.searchWorkshops(value,error) ;
          },
        /*  onTapOutside: (pointerDownEvent){
            AppHelper.closeKeyboard();
          },*/
          controller: cubit.searchController,
          prefixIcon: AppIcons.search,
          hint: 'Search',
        );
      },
    );
  }
}
