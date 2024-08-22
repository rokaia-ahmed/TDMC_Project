import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../network/local/cache/cache_helper.dart';

class CustomArrowBack extends StatelessWidget {
  const CustomArrowBack({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
     alignment:CacheHelper.getData('lang')=='ar'?
    Alignment.topRight:Alignment.topLeft,
      child: InkWell(
          onTap:(){
            Navigator.pop(context);
          },
          child: SvgPicture.asset('',
            //AppIcons.arrowLeft,
            width: 27,
          ),
      ),
    );
  }
}
