import 'package:flutter/material.dart';
import 'package:subhash_dev/configue.dart';

import '../statics/data_values.dart';
import '../statics/key_holders.dart';
import '../theme/app_theme.dart';
import '../widgets/container_card.dart';
import '../widgets/frame_title.dart';

class DS6TechNotes extends StatelessWidget {
  const DS6TechNotes({Key? key}) : super(key: key);

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
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                  children: [
                    ...DataValues.articles.map((e) =>
                        Container(
                          padding: const EdgeInsets.only(
                            left: 10,
                            right: 10,
                          ),
                          width: (context.width*0.47),
                          child: ContainerCard().type3(
                            image: e.image,
                            title: e.title,
                            role: e.role,
                            years: e.publishYear,
                            values: e.content,
                            message: e.content,
                            url: Uri.tryParse(e.url),
                            isButtonEnabled: true,
                          ),
                        ),
                    ).toList(),
                  ],
              ),
            ),
            // SingleChildScrollView(
            //   physics: const BouncingScrollPhysics(),
            //   scrollDirection: Axis.horizontal,
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       ...DataValues.articles.map((e) =>
            //           Padding(
            //             padding: const EdgeInsets.only(
            //               left: 10,
            //               right: 10,
            //             ),
            //             child:  SizedBox(
            //               width: (context.width*0.47),
            //               child: ContainerCard().type3(
            //                 image: e.image,
            //                 title: e.title,
            //                 role: e.role,
            //                 years: e.publishYear,
            //                 values: e.content,
            //                 message: e.content,
            //                 url: Uri.tryParse(e.url),
            //                 isButtonEnabled: true,
            //               ),
            //             ),
            //           ),
            //       ).toList(),
            //     ],
            //   ),
            // ),
            const SizedBox(height: 40.0),
          ],
        ),
      ),
    );
  }
}
