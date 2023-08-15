import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'animated_opacity_when_hovered.dart';
import 'delayed_widget.dart';

class SocialMediaButton extends StatelessWidget {
  final Uri url;
  final IconData iconData;
  final double size;
  final int index;

  const SocialMediaButton({
    required this.url,
    required this.iconData,
    required this.index,
    this.size = 30.0,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DelayedWidget(
      delayDuration: Duration(milliseconds: 1500 + ((index + 1) * 125)),
      from: DelayFrom.bottom,
      child: AnimatedOpacityWhenHovered(
        child: IconButton(
          onPressed: () => launchUrl(url),
          icon: Icon(
            iconData,
            color: Colors.white,
            size: size,
          ),
        ),
      ),
    );
  }
}
