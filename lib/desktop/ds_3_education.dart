import 'package:flutter/material.dart';
import 'package:subhash_dev/configue.dart';

import '../statics/data_values.dart';
import '../statics/key_holders.dart';
import '../theme/app_theme.dart';
import '../widgets/container_card.dart';
import '../widgets/frame_title.dart';

class DS3Education extends StatelessWidget {
  const DS3Education({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      key: KeyHolders.educationKey,
      color: AppThemeData.backgroundGrey,
      child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const FrameTitle(
                title: DataValues.educationTitle,
                description: DataValues.educationDescription),
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ...DataValues.educations.map((e) =>
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 10,
                          right: 10,
                        ),
                        child: SizedBox(
                          width: context.width*0.48,
                          child: ContainerCard().type2(
                            image: e.image,
                            title: e.degreeName,
                            skills: e.gainSkills,
                            skillTitle: 'Learn skills -',
                            message: e.description.toString(),
                            url: DataValues.linkedinURL,
                            subTitle: e.collegeName,
                          ),
                        ),
                      ),
                  ).toList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
