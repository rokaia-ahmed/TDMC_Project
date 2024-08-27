import 'package:flutter/material.dart';

import '../../../../core/utils/app_size.dart';
import '../../../../core/utils/styles.dart';
import '../../../../core/widgets/custom_arrow_back.dart';

class TopTitlesWidget extends StatelessWidget {
  const TopTitlesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CustomArrowBack(),
            SizedBox(
              width: AppSize.getHorizontalSize(10),
            ),
            Text(
              'SIRC',
              style: Styles.textStyle28w700,
            ),
          ],
        ),
        SizedBox(
          height: AppSize.getVerticalSize(10),
        ),
        Text(
          'Evaluation:',
          style: Styles.textStyle28w700,
        ),
        SizedBox(
          height: AppSize.getVerticalSize(9),
        ),
        Text(
          'Business Email Writing',
          style: Styles.textStyle20w700,
        ),
        SizedBox(
          height: AppSize.getVerticalSize(5),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Joseph Abbouda',
              style: Styles.textStyle18w600.copyWith(
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              '28 Agust',
              style: Styles.textStyle14w400,
            ),
          ],
        ),
      ],
    );
  }
}
