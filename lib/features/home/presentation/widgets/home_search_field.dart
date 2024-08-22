import 'package:flutter/material.dart';

import '../../../../core/utils/app_images.dart';
import '../../../../core/widgets/custom_text_form_field.dart';

class HomeSearchField extends StatelessWidget {
  const HomeSearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return  CustomTextField(
      controller: TextEditingController(),
      prefixIcon:AppIcons.search ,
      hint: 'Search',
    );
  }
}
