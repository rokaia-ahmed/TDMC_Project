import 'package:flutter/material.dart';
import 'package:tdmc_project/core/utils/app_size.dart';

import 'notification_list_item.dart';

class NotificationList extends StatelessWidget {
  const NotificationList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
          shrinkWrap: true,
          itemBuilder:(context,index)=>
          NotificationListItem(),
          separatorBuilder:(context,index)=>
          SizedBox(
            height:AppSize.getVerticalSize(15) ,
          ),
          itemCount: 10),
    );
  }
}
