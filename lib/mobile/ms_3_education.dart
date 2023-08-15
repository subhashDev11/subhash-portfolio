import 'package:flutter/material.dart';

import '../statics/data_values.dart';
import '../statics/key_holders.dart';
import '../theme/app_theme.dart';
import '../widgets/container_card.dart';
import '../widgets/frame_title.dart';

class MS3Education extends StatelessWidget {
  const MS3Education({Key? key}) : super(key: key);

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
            const SizedBox(height: 30.0),
            ...DataValues.educations.map((e) =>
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 20,
                  ),
                  child: ContainerCard().type2(
                    image: e.image,
                    title: e.degreeName,
                    subTitle: e.collegeName,
                    message: e.description,
                    url: DataValues.linkedinURL,
                    skills: e.gainSkills,
                    skillTitle: 'Learn skills -',
                  ),
                ),
            ).toList(),
          ],
        ),
      ),
    );
  }
}
