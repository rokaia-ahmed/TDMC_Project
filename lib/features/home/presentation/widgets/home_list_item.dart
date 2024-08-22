import 'package:flutter/material.dart';
import '../../../../core/utils/app_size.dart';
import '../../../../core/utils/styles.dart';

class HomeListItem extends StatelessWidget {
  const HomeListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:(){
      },
      child: Card(
        child:Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('SIRC',
                style:Styles.textStyle16w700,
              ),
              SizedBox(height: AppSize.getVerticalSize(5),),
              Text('Movenpick - Business Email Writing',
              style:Styles.grayText,
              ),
              SizedBox(height: AppSize.getVerticalSize(5),),
              Text('12 . August. 2024',
                style:Styles.textStyle12w500,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
