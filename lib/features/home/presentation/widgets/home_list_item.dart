import 'package:flutter/material.dart';
import '../../../../core/utils/app_size.dart';
import '../../../../core/utils/styles.dart';
import '../../data/models/workshops_model.dart';

class HomeListItem extends StatelessWidget {
  const HomeListItem({super.key, this.onTap,required this.model});
  final Function()? onTap ;
  final Result model ;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:onTap,
      child: Card(
        margin: EdgeInsets.zero,
        child:Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(model.companyName??'',
                style:Styles.textStyle16w600,
              ),
              SizedBox(height: AppSize.getVerticalSize(5),),
              Text(model.venueName??'',
              style:Styles.grayText,
              ),
              SizedBox(height: AppSize.getVerticalSize(5),),
              Text(model.fromDate!,
                style:Styles.textStyle12w500,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
