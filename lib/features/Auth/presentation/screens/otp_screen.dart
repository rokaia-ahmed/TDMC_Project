import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tdmc_project/core/utils/app_colors.dart';
import '../../../../core/dependancy_injection/injection.dart';
import '../../../../core/utils/app_size.dart';
import '../../../../core/utils/styles.dart';
import '../../../../core/validators/app_validators.dart';
import '../../../../core/widgets/custom_buttons.dart';
import '../../logic/auth_cubit.dart';
import '../widgets/otp_pin_code.dart';
import '../widgets/otp_top_widgets.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key, required this.phone});
  final String phone ;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AuthCubit>()..startCountdown(),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: AppSize.padding(all: 10),
              child: BlocConsumer<AuthCubit,AuthState>(
                listener:(context, state){
                  if(state is LoadingOtp ){
                    AuthCubit.get(context).startCountdown();
                  }
                },
                builder: (context, state) {
                  var cubit =AuthCubit.get(context);
                  return Form(
                    key: cubit.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const OtpTopWidgets(),
                        /// otp
                        OtpPinCode(
                          controller: cubit.otpController,
                          errorTextSpace:/*cubit.isValidate ?10:*/25,
                          validator: (v)=>otpValidate(v!),
                        ),
                        if(cubit.isValidate ==false)
                        SizedBox(
                          height: AppSize.getVerticalSize(5),
                        ),
                        // cubit.count<30&&cubit.count>0
                        /// reset code
                        InkWell(
                          onTap: (state is CountdownTick)?null:(){
                              cubit.resendOtp(context,phone);
                              },
                          child: Padding(
                            padding: AppSize.padding(start: 20),
                            child: Text('Resend code ${(cubit.count<30&&cubit.count>0)?
                            '(00:${cubit.count})':''}',
                              style: Styles.textStyle14w400.copyWith(
                                decorationColor:AppColors.gryTextColor3 ,
                                color:(state is CountdownTick)?AppColors.gryTextColor3
                                    :AppColors.primaryColor,
                                decoration:(state is CountdownTick)?
                                TextDecoration.underline:null,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: AppSize.getVerticalSize(25),
                        ),

                        /// button
                        CustomDefaultButton(
                          loading: (state is Loading )
                              || (state is LoadingOtp)
                              /*|| (state is CountdownStopped)*/,
                          onTap: () {
                           cubit.otp(context, phone);
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
