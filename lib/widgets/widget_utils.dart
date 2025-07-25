// Quick Widgets class.
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class WidgetUtils {
  static Widget getSvgImage(String assetPath,
      {double width = 17, double height = 17}) {
    return SvgPicture.asset(assetPath, width: width, height: height);
  }
}
