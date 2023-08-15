import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

extension ContextExt on BuildContext {
  double get height => MediaQuery.of(this).size.height;
  double get width => MediaQuery.of(this).size.width;
}


// Some utility extensions on responsive_framework package.
extension BuildContextX on BuildContext {
  ResponsiveWrapperData get responsiveness {
    return ResponsiveWrapper.of(this);
  }

  bool get isMobile => responsiveness.isPhone;
  bool get isTablet => responsiveness.isTablet;
  bool get isDesktop => responsiveness.isDesktop;

  ThemeData get theme => Theme.of(this);
  Color get primaryColor => Theme.of(this).primaryColor;
}


// Extracted from "flutter_custom_clippers" package.
class DiagonalPathClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path()
      ..lineTo(0.0, size.height)
      ..lineTo(size.width, size.height - 112.0)
      ..lineTo(size.width, 0.0)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
