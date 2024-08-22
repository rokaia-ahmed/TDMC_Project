import 'package:flutter/material.dart';
import '../utils/app_size.dart';
import '../utils/styles.dart';
import 'custom_arrow_back.dart';

PreferredSizeWidget customAppBar(
    {required String title, bool isBackButton = true}) {
  return AppBar(
    centerTitle: true,
    backgroundColor: Colors.transparent,
    elevation: 0.0,
    leading: (isBackButton)
        ? Padding(
            padding: AppSize.padding(
              top: 10,
              start: 15,
            ),
            child: const CustomArrowBack(),
          )
        : const SizedBox(),
    title: Padding(
      padding: AppSize.padding(
        top: 10,
      ),
      child: Text(
        title,
        style: Styles.textStyle16w400.copyWith(
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
      ),
    ),
  );
}
