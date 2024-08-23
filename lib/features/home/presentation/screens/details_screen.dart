import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tdmc_project/core/utils/styles.dart';
import 'package:tdmc_project/core/widgets/custom_buttons.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_constants.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_size.dart';
import '../../data/models/workshops_model.dart';
import '../widgets/home_list_item.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key,required this.model});
  final Result model ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: AppSize.padding(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              /// top row
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: AppSize.padding(horizontal: 10, vertical: 10),
                      decoration: AppConstants.boxDecoration,
                      child: SvgPicture.asset(AppIcons.rightArrow),
                    ),
                  ),
                  SizedBox(
                    width: AppSize.getHorizontalSize(10),
                  ),
                  Text(
                    '${model.companyName??''} ',
                    style: Styles.textStyle20w600,
                  ),
                  Expanded(
                    child: Text(
                      model.topicName??'',
                      style: Styles.textStyle15w400,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: AppSize.getVerticalSize(40),
              ),

              /// title text
              Text(
                model.topicName??'',
                style: Styles.textStyle20w600,
              ),
              SizedBox(
                height: AppSize.getVerticalSize(10),
              ),

              /// over all text
              Text(
                model.learningOutcome??'',
                style: Styles.grayText.copyWith(
                  fontWeight: FontWeight.w400,
                  height: 2.3,
                ),
              ),
              SizedBox(
                height: AppSize.getVerticalSize(40),
              ),

              /// white card
              HomeListItem(model: model,),
              SizedBox(
                height: AppSize.getVerticalSize(20),
              ),

              /// bottom buttons
              Padding(
                padding: AppSize.padding(horizontal: 15),
                child: Row(
                  children: [
                    Expanded(
                      child: CustomDefaultButton(
                        onTap: () {},
                        text: 'Workshop assessment',
                        textStyle: Styles.textStyle12w600.copyWith(
                          color: AppColors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: AppSize.getHorizontalSize(10),
                    ),
                    Expanded(
                      child: CustomDefaultButton(
                        onTap: () {},
                        text: 'Withdraw',
                        textStyle: Styles.textStyle12w600.copyWith(
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
