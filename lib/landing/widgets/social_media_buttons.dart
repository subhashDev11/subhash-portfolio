import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:subhash_dev/configue.dart';
import 'package:subhash_dev/landing/widgets/social_media_button.dart';
import 'package:subhash_dev/statics/data_values.dart';
import 'package:subhash_dev/widgets/button_icon.dart';

class SocialMediaButtons extends StatelessWidget {
  const SocialMediaButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final alignment = context.isDesktop ? WrapAlignment.start : WrapAlignment.center;
    final wrapAlignment = context.isMobile ? Alignment.center : null;

    return Container(
      alignment: wrapAlignment,
      child: Wrap(
        spacing: 16.0,
        runSpacing: 16.0,
        alignment: alignment,
        children: [
          SocialMediaButton(
          index: 0,
              url: DataValues.devURL,
           iconData: FontAwesomeIcons.dev,
          ),
          SocialMediaButton(
          index: 1,
              url: DataValues.hashnodeURL,
            iconData: FontAwesomeIcons.hashnode,
          ),
          SocialMediaButton(
            index: 2,
            url: DataValues.githubURL,
            iconData: FontAwesomeIcons.github,
          ),
          SocialMediaButton(
            index: 3,
            url: DataValues.linkedinURL,
            iconData: FontAwesomeIcons.linkedin,
          ),
          SocialMediaButton(
            index: 4,
            url: DataValues.youtubeURL,
            iconData: FontAwesomeIcons.youtube,
          ),
          SocialMediaButton(
            index: 5,
            url: DataValues.instagramURL,
            iconData: FontAwesomeIcons.instagram,
          ),
        ],
      ),
    );
  }
}
