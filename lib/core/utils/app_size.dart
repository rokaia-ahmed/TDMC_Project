
import 'package:flutter/material.dart';

class AppSize {
  /// REFERENCE VALUES FROM THE FIGMA DESIGN.
  static const num designWidth = 365;
  static const num designHeight = 812;
  static const num designStatusBar = 44;

  /// INITIALIZE SIZE USING THE PHYSICAL SIZE AND DEVICE PIXEL RATIO.
  static final Size size =  WidgetsBinding.instance.platformDispatcher.views.first.physicalSize/
      WidgetsBinding.instance.platformDispatcher.views.first.devicePixelRatio;

  /*static const  double sizeWidth =360.0 ;
  static const double sizeHeight = 650.0;*/


  /// GET THE DEVICE VIEWPORT WIDTH.
  static double get width => size.width;

  /// GET THE DEVICE VIEWPORT HEIGHT, ACCOUNTING FOR STATUS BAR AND BOTTOM BAR.
  static double get height {
    num statusBar = MediaQueryData.fromView(
      WidgetsBinding.instance.platformDispatcher.views.first,
    ).viewPadding.top;
    num bottomBar = MediaQueryData.fromView(
      WidgetsBinding.instance.platformDispatcher.views.first,
    ).viewPadding.bottom;
    return (size.height - statusBar - bottomBar).toDouble();
  }

  /// CALCULATE HORIZONTAL SIZE ACCORDING TO VIEWPORT WIDTH.
  static double getHorizontalSize(double px) {
    return (px * width) / designWidth;
  }

  /// CALCULATE VERTICAL SIZE ACCORDING TO VIEWPORT HEIGHT.
  static double getVerticalSize(double px) {
    return (px * height) / (designHeight - designStatusBar);
  }

  /// GET THE SMALLEST SIZE FOR IMAGE HEIGHT AND WIDTH.
  static double getSize(double px) {
    double vSize = getVerticalSize(px);
    double hSize = getHorizontalSize(px);
    return (vSize < hSize)
        ? vSize.toInt().toDouble()
        : hSize.toInt().toDouble();
  }

  /// GET FONT SIZE ACCORDING TO VIEWPORT.
  static double fontSize(double px) => getSize(px);

  /// SET PADDING RESPONSIVELY.
  static EdgeInsetsGeometry padding({
    double? all,
    double? top,
    double? end,
    double? start,
    double? bottom,
    double? vertical,
    double? horizontal,
  }) {
    return getMarginOrPadding(
      all: all,
      top: top,
      end: end,
      start: start,
      bottom: bottom,
      vertical: vertical,
      horizontal: horizontal,
    );
  }

  /// SET MARGIN RESPONSIVELY.
  static EdgeInsetsDirectional margin({
    double? all,
    double? top,
    double? end,
    double? start,
    double? bottom,
    double? vertical,
    double? horizontal,
  }) {
    return getMarginOrPadding(
      all: all,
      top: top,
      end: end,
      start: start,
      bottom: bottom,
      vertical: vertical,
      horizontal: horizontal,
    );
  }

  /// GET PADDING OR MARGIN RESPONSIVELY.
  static EdgeInsetsDirectional getMarginOrPadding({
    double? all,
    double? top,
    double? end,
    double? start,
    double? bottom,
    double? vertical,
    double? horizontal,
  }) {
    /// IF 'ALL' IS PROVIDED, APPLY IT TO ALL SIDES; OTHERWISE, USE INDIVIDUAL VALUES.
    if (all != null) {
      top = all;
      end = all;
      start = all;
      bottom = all;
    }
    if (horizontal != null) {
      start = horizontal;
      end = horizontal;
    }
    if (vertical != null) {
      top = vertical;
      bottom = vertical;
    }

    /// RETURN EDGE INSETS DIRECTIONAL WITH CALCULATED VALUES.
    return EdgeInsetsDirectional.only(
      top: getVerticalSize(top ?? 0),
      end: getHorizontalSize(end ?? 0),
      bottom: getVerticalSize(bottom ?? 0),
      start: getHorizontalSize(start ?? 0),
    );
  }
}
