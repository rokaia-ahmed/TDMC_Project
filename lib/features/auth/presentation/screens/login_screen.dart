import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tdmc_project/core/dependancy_injection/injection.dart';
import 'package:tdmc_project/core/utils/app_images.dart';
import 'package:tdmc_project/core/utils/app_size.dart';
import 'package:tdmc_project/core/validators/app_validators.dart';
import 'package:tdmc_project/core/widgets/custom_text_form_field.dart';
import '../../../../core/widgets/custom_buttons.dart';
import '../../logic/auth_cubit.dart';
import '../widgets/country_code.dart';
import '../widgets/login_top_widgets.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AuthCubit>(),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: AppSize.padding(all: 10),
              child: BlocBuilder<AuthCubit,AuthState>(
                builder: (context, state) {
                  var cubit =AuthCubit.get(context);
                  return Form(
                    key: cubit.formKey,
                    child: Column(
                      children: [
                        const LoginTopWidget(),
                        /// country code
                        CustomTextField(
                          controller: cubit.cadeCountryController,
                          hint: 'code',
                          readOnly: true,
                          keyboardType: TextInputType.phone,
                          codeWidget: const CountryCode(),
                           prefixIcon:AppIcons.downArrow,
                          suffixIcon: SvgPicture.asset(AppIcons.map),
                          validator: (v)=>validate(v!),
                        ),
                        SizedBox(
                          height: AppSize.getVerticalSize(20),
                        ),

                        /// phone number
                        CustomTextField(
                          controller: cubit.phoneController,
                          hint: 'Phone Number',
                          prefixIcon: AppIcons.phone,
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          //suffixIcon:SvgPicture.asset(AppIcons.securityEye),
                          validator: (v)=>validateMobile(v!),
                        ),
                        SizedBox(
                          height: AppSize.getVerticalSize(20),
                        ),
                        CustomDefaultButton(
                          loading: state is Loading,
                          onTap: () {
                           cubit.login(context);
                          },
                          text: 'Continue',
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
