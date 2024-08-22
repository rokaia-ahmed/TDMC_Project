import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tdmc_project/core/utils/app_size.dart';
import 'package:tdmc_project/features/Auth/logic/auth_cubit.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_radius.dart';
/// text form field
 InputBorder defaultBorder = OutlineInputBorder(
  borderRadius: AppRadius.radius10,
  borderSide: const BorderSide(
    color:AppColors.borderColor,
  )
);
class CountryCode extends StatelessWidget {
  const CountryCode({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit,AuthState>(
      builder: (context, state) {
        var cubit =AuthCubit.get(context);
        return SizedBox(
          height: AppSize.getVerticalSize(50),
          child: CountryCodePicker(
            padding: EdgeInsets.zero,
            initialSelection: 'EG',
            favorite: const ['+20', 'EG'],
            flagWidth: AppSize.getHorizontalSize(25),
            boxDecoration:BoxDecoration(
              borderRadius: AppRadius.radius10,
              color: Colors.white,
              border: Border.all(
                color: AppColors.borderColor,
              ),
            ),
            searchDecoration:InputDecoration(
              hintText: 'search',
              enabledBorder: defaultBorder,
              focusedBorder: defaultBorder,
              border: defaultBorder
            ),
            showCountryOnly: false,
            showFlagDialog: true,
            onInit:(code){
             cubit.onChangeCountry(code.toString(),code?.name);
            },
            onChanged:(code){
              cubit.onChangeCountry(code.toString(),code.name);
            },
          ),
        );
      },
    );
  }
}
