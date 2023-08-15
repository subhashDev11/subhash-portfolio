import 'package:flutter/material.dart';

import '../statics/data_values.dart';
import '../statics/key_holders.dart';
import '../theme/app_theme.dart';
import '../widgets/container_card.dart';
import '../widgets/frame_title.dart';

class MS6TechNotes extends StatelessWidget {
  const MS6TechNotes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      key: KeyHolders.technotesKey,
      color: AppThemeData.backgroundGrey,
      child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const FrameTitle(
                title: DataValues.technotesTitle,
                description: DataValues.technotesDescription,
            ),
            ...DataValues.articles.map((e) =>
            Padding(
                padding: const EdgeInsets.only(top: 30),
                child:  ContainerCard().type3(
                  image: e.image,
                  title: e.title,
                  role: e.role,
                  years: e.publishYear,
                  values: e.content,
                  message: e.content,
                  url: Uri.tryParse(e.url),
                  isButtonEnabled: true,
                ),
            )).toList(),
          ],
        ),
      ),
    );
  }
}
