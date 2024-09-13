import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../core/utils/app_size.dart';
import '../../../../core/utils/styles.dart';
import '../widgets/profile_data.dart';
import '../widgets/profile_language.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: AppSize.padding(vertical: 15,horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: AppSize.getVerticalSize(10),
            ),
            /// profile Data
            ProfileData(),
            SizedBox(
              height: AppSize.getVerticalSize(20),
            ),
            Text('profile.languages'.tr(),
              style: Styles.textStyle18w700,
            ),
            SizedBox(
              height: AppSize.getVerticalSize(20),
            ),
            ProfileLanguage(),
            SizedBox(
              height: AppSize.getVerticalSize(20),
            ),
          ],
        ),
      ),
    );
  }
}
