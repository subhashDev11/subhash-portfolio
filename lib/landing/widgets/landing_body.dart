import 'package:flutter/material.dart';
import 'package:subhash_dev/configue.dart';
import 'package:subhash_dev/desktop/ds_2_about_me.dart';
import 'package:subhash_dev/desktop/ds_3_education.dart';
import 'package:subhash_dev/desktop/ds_4_experience.dart';
import 'package:subhash_dev/desktop/ds_6_technotes.dart';
import 'package:subhash_dev/desktop/ds_7_contact.dart';
import 'package:subhash_dev/desktop/ds_8_footer.dart';
import 'package:subhash_dev/landing/widgets/delayed_widget.dart';
import 'package:subhash_dev/mobile/ms_2_about_me.dart';
import 'package:subhash_dev/mobile/ms_3_education.dart';
import 'package:subhash_dev/mobile/ms_4_experience.dart';
import 'package:subhash_dev/mobile/ms_6_technotes.dart';
import 'package:subhash_dev/mobile/ms_7_contact.dart';
import 'package:subhash_dev/mobile/ms_8_footer.dart';

class LandingBody extends StatelessWidget {
  const LandingBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget desktopUI() {
      return ListView(
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        children: const [
          DelayedWidget(
              delayDuration: Duration(milliseconds: 2300),
              from: DelayFrom.bottom,
              child: DS2AboutMe()),
          DelayedWidget(
              delayDuration: Duration(milliseconds: 2400),
              from: DelayFrom.bottom,
              child: DS3Education()),
          DelayedWidget(
              delayDuration: Duration(milliseconds: 2500),
              from: DelayFrom.bottom,
              child: DS4Experience()),
          DelayedWidget(
              delayDuration: Duration(milliseconds: 2600),
              from: DelayFrom.bottom,
              child: DS6TechNotes()),
          DelayedWidget(
              delayDuration: Duration(milliseconds: 2700),
              from: DelayFrom.bottom,
              child: DS7Contact()),
          DelayedWidget(
            delayDuration: Duration(milliseconds: 2800),
            from: DelayFrom.bottom,
            child: DS8Footer(),
          ),
        ],
      );
    }

    Widget mobileUI() {
      return ListView(
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        children: const [
          //MS1Header(),
          MS2AboutMe(),
          MS3Education(),
          MS4Experience(),
          //MS5Volunteering(),
          MS6TechNotes(),
          MS7Contact(),
          MS8Footer(),
        ],
      );
    }

    return Container(
      // Keeps UI clean and centered when screen size is bigger than 1200.0
      constraints: const BoxConstraints(maxWidth: 1200.0),
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (context.isDesktop) desktopUI() else mobileUI(),
        ],
      ),
    );
  }
}
