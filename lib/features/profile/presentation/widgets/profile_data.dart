import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tdmc_project/core/widgets/custom_error_widget.dart';
import 'package:tdmc_project/core/widgets/custom_loading.dart';
import 'package:tdmc_project/features/profile/logic/profile_cubit.dart';
import 'package:tdmc_project/features/profile/presentation/widgets/profile_container.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_size.dart';

class ProfileData extends StatelessWidget {
  const ProfileData({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        var cubit = ProfileCubit.get(context);
        if (state is Loading) {
          return CustomLoading3();
        } else if (state is Success) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProfileContainer(
                title: 'profile.full_name'.tr(),
                subTitle: cubit.profileModel!.userName ?? '',
                icon: AppIcons.profile2,
              ),
              SizedBox(
                height: AppSize.getVerticalSize(20),
              ),
              ProfileContainer(
                title: 'profile.number'.tr(),
                subTitle: cubit.profileModel!.phoneNumber ?? '',
                icon: AppIcons.phone2,
              ),
              SizedBox(
                height: AppSize.getVerticalSize(20),
              ),
              ProfileContainer(
                title: 'profile.email_address'.tr(),
                subTitle: cubit.profileModel!.email ?? '',
                icon: AppIcons.email,
              ),
              SizedBox(
                height: AppSize.getVerticalSize(20),
              ),
              ProfileContainer(
                title: 'profile.company'.tr(),
                subTitle: cubit.profileModel!.company!.name ?? '',
                icon: AppIcons.company,
              ),
            ],
          );
        } else if (state is Error) {
          return CustomError3(error: state.errorMsg);
        } else {
          return Container();
        }
      },
    );
  }
}
