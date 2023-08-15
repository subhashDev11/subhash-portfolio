import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../theme/app_theme.dart';
import '../widgets/text_pairs.dart';
import 'button_text.dart';

class ContainerCard {
  Widget type1({
    required String title,
    required String description,
    required String image,
    required String message,
    required Uri url,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: AppThemeData.cardGrey,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                image.contains('http')
                    ? Image.network(image, height: 70.0, width: 70.0)
                    : Image.asset(image, height: 70.0, width: 70.0),
                const SizedBox(height: 20.0),
                SelectableText(
                  title,
                  style: TextStyle(
                    fontSize:
                        AppThemeData.darkTheme.textTheme.titleMedium!.fontSize,
                    fontWeight: AppThemeData
                        .darkTheme.textTheme.headlineSmall!.fontWeight,
                    color: AppThemeData.textWhite,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10.0),
            SelectableText(description,
                style: AppThemeData.darkTheme.textTheme.labelLarge),
            const SizedBox(height: 20.0),
            // ButtonTextSmall(
            //   text: 'View More >>',
            //   message: message,
            //   url: url,
            // ),
          ],
        ),
      ),
    );
  }

  Widget type2({
    required String image,
    required String title,
    required String subTitle,
    required String skillTitle,
    required List<String> skills,
    required String message,
    required Uri? url,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: AppThemeData.cardGrey,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundImage: getImage(image),
                  radius: 40,
                  backgroundColor: Colors.transparent,
                ),
                const SizedBox(height: 20.0),
                SelectableText(title,
                    style: TextStyle(
                      fontSize: AppThemeData
                          .darkTheme.textTheme.titleMedium!.fontSize,
                      fontWeight: AppThemeData
                          .darkTheme.textTheme.headlineSmall!.fontWeight,
                      color: AppThemeData.textPrimary,
                    )),
                const SizedBox(height: 10.0),
                SelectableText(
                   subTitle,
                    style: TextStyle(
                      fontSize: AppThemeData
                          .darkTheme.textTheme.titleSmall!.fontSize,
                      fontWeight: AppThemeData
                          .darkTheme.textTheme.bodyMedium!.fontWeight,
                      color: AppThemeData.darkTheme.textTheme.bodySmall?.color,
                    ),
                ),
                skillsWidget(
                    skillTitle,
                    skills,
                )
                // TextPairs().type2(
                //   title: values[0],
                //   value1: values[1],
                //   value2: values[2],
                //   isThreeLines: false,
                // ),
                // const SizedBox(height: 10.0),
                // TextPairs().type2(
                //   title: values[3],
                //   value1: values[4],
                //   value2: values[5],
                //   isThreeLines: false,
                // ),
                // const SizedBox(height: 10.0),
                // TextPairs().type2(
                //   title: values[6],
                //   value1: values[7],
                //   value2: values[8],
                //   isThreeLines: false,
                // ),
              ],
            ),
            const SizedBox(height: 20.0),
            ButtonTextSmall(
              text: 'View More >>',
              message: message,
              url: url,
            ),
          ],
        ),
      ),
    );
  }

  Widget type3({
    required String image,
    required String title,
    required String role,
    required String years,
    required String values,
     String? skillTitle,
     List<String>? skills,
    required String message,
    required Uri? url,
    required bool isButtonEnabled,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: AppThemeData.cardGrey,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundImage: getImage(image),
                  radius: 35,
                  backgroundColor: Colors.transparent,
                ),
                const SizedBox(height: 20.0),
                SelectableText(title,
                    style: TextStyle(
                      fontSize: AppThemeData
                          .darkTheme.textTheme.titleMedium!.fontSize,
                      fontWeight: AppThemeData
                          .darkTheme.textTheme.headlineSmall!.fontWeight,
                      color: AppThemeData.textPrimary,
                    ),
                ),
                // const SizedBox(height: 10.0),
                TextPairs().type2(
                  title: role,
                  value1: years,
                  value2: values,
                  isThreeLines: true,
                ),
                if(skillTitle!=null && skills!=null)
                skillsWidget(skillTitle, skills),
              ],
            ),
            const SizedBox(height: 20.0),
            isButtonEnabled
                ? ButtonTextSmall(
                    text: 'View More >>',
                    message: message,
                    url: url,
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }

  Widget type4({
    required String image,
    required String title,
    required String message,
    required Uri url,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Tooltip(
          message: 'Visit $message',
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () async {
                if (!await launchUrl(url)) {
                  throw 'Could not launch $url';
                }
                log("Direct to: $url");
              },
              child: Text(
                message,
                style: TextStyle(
                  fontSize:
                      AppThemeData.darkTheme.textTheme.labelLarge!.fontSize,
                  fontWeight:
                      AppThemeData.darkTheme.textTheme.labelLarge!.fontWeight,
                  color: AppThemeData.textWhite,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  ImageProvider getImage(String image) {
    if (image.contains('http')) {
      return NetworkImage(image,);
    } else {
      return AssetImage(
        'assets/images/$image.png',
      );
    }
  }

  Widget skillsWidget(String title,List<String> skills){
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(
          height: 10,
        ),
        Text(
            title,
            style: TextStyle(
              fontSize: AppThemeData
                  .darkTheme.textTheme.titleMedium!.fontSize,
              fontWeight: AppThemeData
                  .darkTheme.textTheme.headlineSmall!.fontWeight,
              color: AppThemeData.textPrimary,
            )
        ),
        Container(
          padding: const EdgeInsets.only(
            bottom: 10,
            top: 10,
          ),
          height: 50,
          child:  Text(
              skills.joinToString(),
              style: ThemeData.dark().textTheme.bodySmall?.copyWith()
          ),
        )
      ],
    );
  }
}

extension StringListExtensions on List<String> {
  String joinToString() {
    return join(', ');
  }
}

