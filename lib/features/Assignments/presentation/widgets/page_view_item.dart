import 'package:flutter/material.dart';
import 'package:tdmc_project/core/utils/app_colors.dart';
import 'package:tdmc_project/core/utils/app_constants.dart';
import 'package:tdmc_project/core/utils/app_radius.dart';
import 'package:tdmc_project/core/utils/app_size.dart';
import 'package:tdmc_project/core/utils/styles.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({super.key, required this.index});
  final int index ;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// number of question row
        Row(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
         Container(
           padding: AppSize.padding(vertical:5,horizontal:10),
           decoration: AppConstants.boxDecoration,
             child: Text('Questions $index',
             style: Styles.textStyle16w700.copyWith(
               color: AppColors.primaryColor,
             ),
             ),
         ),
          Text('1/10',
            style: Styles.textStyle16w700.copyWith(
              color: AppColors.primaryColor,
            ),
          ),
        ],
       ),
        SizedBox(
          height: AppSize.getVerticalSize(15),
        ),
        /// linear progress
        LinearProgressIndicator(
          value: 0.1,
          minHeight:AppSize.getVerticalSize(25),
          borderRadius: AppRadius.radius10,
          backgroundColor: AppColors.gryColor2.withOpacity(0.6),
          color: AppColors.secondColor,
        ),
        SizedBox(
          height: AppSize.getVerticalSize(15),
        ),
        Text(
          'Course material met the stated objectives ',
          style: Styles.textStyle16w700,
        ),
        SizedBox(
          height: AppSize.getVerticalSize(15),
        ),
       // BuildChooseContainer(),
        /// Questions
        Flexible(
          child: ListView.separated(
               shrinkWrap: true,
              physics:AlwaysScrollableScrollPhysics(),
              itemBuilder:(context,index)=>BuildChooseContainer(),
              separatorBuilder: (context,index)=>SizedBox(
                height: AppSize.getVerticalSize(10),
              ),
              itemCount: 4),
        ),
        SizedBox(
          height: AppSize.getVerticalSize(10),
        ),
        Padding(
          padding: AppSize.padding(start:15),
          child: Text(
            'Unanswered questions\n'
            '(Click on the number to go to the question)',
            style: Styles.textStyle14w600.copyWith(
              color: AppColors.gryColor,
            ),
          ),
        ),
      ],
    );
  }
}

class BuildChooseContainer extends StatelessWidget {
  const BuildChooseContainer({super.key});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){

      },
      child: Container(
        padding: AppSize.padding(vertical: 7,end:7),
        margin:AppSize.padding(start: 15) ,
        decoration:BoxDecoration(
          boxShadow: [
            BoxShadow(
              color:AppColors.shadowBlueColor,
              spreadRadius: 0,
              offset: Offset(2, 2),
              blurRadius: 4,
              blurStyle: BlurStyle.normal,
            ),
          ],
          borderRadius: AppRadius.radius15,
          color: Colors.white,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
         // mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              padding:AppSize.padding(horizontal: 13,
                  vertical: 3),
              decoration:BoxDecoration(
                borderRadius: AppRadius.radius20,
                color: AppColors.secondColor,
              ),
              child:Text('A',
                style:Styles.textStyle18w600.copyWith(color: Colors.white),
              ),
            ),
            SizedBox(
              width: AppSize.getHorizontalSize(10),
            ),
            Expanded(
              child: Text(
                maxLines: 2,
                'Course material met the stated objectives',
                   // 'حققت المادة العلمية الأهداف المنشودة من ورشة العمل'
                style: Styles.textStyle16w400.copyWith(
                  height: 1.1,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
