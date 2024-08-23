import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../utils/app_radius.dart';

class AppConstants {
  /// container
  static final Decoration boxDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: AppRadius.radius10,
  );

  static OutlineInputBorder dialogShape = OutlineInputBorder(
    borderRadius: AppRadius.radius10,
    borderSide: BorderSide.none,
  );

  /// text form field
  static InputBorder defaultBorder = OutlineInputBorder(
    borderRadius: AppRadius.radius10,
    borderSide: BorderSide.none,
  );


  static LinearGradient containerGradiant = const LinearGradient(
    colors: [
      AppColors.hintTextGry,
      Colors.white,
      Colors.white,
      //AppColors.lightGry,
    ],
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
    stops: [0, 0.4, 0.9, 0.95],
  );
}
