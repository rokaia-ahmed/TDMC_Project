import 'package:flutter/material.dart';

class AppRadius {
  /// 05 05 05 05
  static BorderRadius radius5 = BorderRadius.circular(5.0);

  /// 10 10 10 10
  static BorderRadius radius10 = BorderRadius.circular(10.0);

  static BorderRadius radius12 = BorderRadius.circular(12.0);
  /// 15 15 15 15
  static BorderRadius radius15 = BorderRadius.circular(15.0);

  /// 20 20 20 20
  static BorderRadius radius20 = BorderRadius.circular(20.0);

  /// 25 25 25 25
  static BorderRadius radius25 = BorderRadius.circular(25.0);

  /// 30 30 30 30
  static BorderRadius radius30 = BorderRadius.circular(30.0);

  /// TOP 30 30
  static BorderRadius radiusTop25 = const BorderRadius.only(
    topLeft: Radius.circular(25),
    topRight: Radius.circular(25),
  );
}
