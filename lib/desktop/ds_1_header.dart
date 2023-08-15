import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:subhash_dev/configue.dart';
import 'package:subhash_dev/landing/widgets/animated_background_image.dart';
import 'package:subhash_dev/landing/widgets/delayed_widget.dart';
import 'package:subhash_dev/landing/widgets/social_media_buttons.dart';
import 'package:subhash_dev/statics/data_values.dart';
import 'package:subhash_dev/widgets/social_profiles.dart';

const dividerColor = Color(0xFF464751);

class LandingHeader extends StatelessWidget {
  final ScrollController scrollController;

  const LandingHeader(
      this.scrollController, {
        super.key,
      });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: DiagonalPathClipper(),
      child: Stack(
        fit: StackFit.loose,
        children: [
          // Widget that has animated background image while scrolling
          AnimatedBackgroundImage(scrollController),

          // The part that is on the "AnimatedBackgroundImage" widget.
          Align(
            alignment: Alignment.center,
            child: _buildSurface(context),
          ),
        ],
      ),
    );
  }

  Widget _buildSurface(BuildContext context) {
    // Altough the "responsive_framework" package handles most of the
    // responsiveness-related stuff for us, we need some cusotm styling based on
    // the current view whether it is mobile, tablet or desktop.
    //
    // At that moment, ResponsiveValue<T> comes very handy and I've added some
    // BuildContext extensions to it.

    // Title text size: when Tablet and Mobile = 24, when Desktop = 40
    final titleSize = ResponsiveValue<double>(
      context,
      defaultValue: 24.0,
      valueWhen: [
        const Condition.equals(name: TABLET, value: 24.0),
        const Condition.largerThan(name: TABLET, value: 40.0),
      ],
    ).value;

    // Logo size: when Tablet and Mobile = 56, when Desktop = 64
    final logoSize = ResponsiveValue<double>(
      context,
      defaultValue: 80.0,
      valueWhen: [
        const Condition.equals(name: TABLET, value: 106.0),
        const Condition.largerThan(name: TABLET, value: 120.0),
      ],
    ).value;

    // Motto text size: when Tablet and Mobile = 14, when Desktop = 16
    final mottoSize = ResponsiveValue<double>(
      context,
      defaultValue: 14.0,
      valueWhen: [
        const Condition.equals(name: TABLET, value: 14.0),
        const Condition.largerThan(name: TABLET, value: 16.0),
      ],
    ).value;

    // Motto text alignment: when Desktop = start, when Mobile and Tablet = center.
    final mottoTextAlignment = context.isDesktop ? TextAlign.start : TextAlign.center;

    // Max width of centered view when Mobile = 602, Tablet = 800, when Desktop = 1200
    final maxWidth = ResponsiveValue<double>(
      context,
      defaultValue: 602.0,
      valueWhen: [
        const Condition.equals(name: TABLET, value: 800.0),
        const Condition.largerThan(name: TABLET, value: 1200.0),
      ],
    ).value!;

    return Container(
      alignment: Alignment.center,
      constraints: BoxConstraints(maxWidth: maxWidth),
      padding: const EdgeInsets.symmetric(
        vertical: 96.0,
        horizontal: 24.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Personal logo
              const CircleAvatar(
                // child: Image.asset(
                //   'assets/images/logo.png',
                //   //'https://github.com/subhashDev11/me/blob/main/me.jpg',
                //   // placeholder: 'assets/images/me.jpg',
                //   height: logoSize,
                //   width: logoSize,
                // ),
                radius: 75,
                backgroundImage: AssetImage('assets/images/logo.png'),
                backgroundColor: Colors.transparent,
              ),
              const SizedBox(width: 12.0),

              Expanded(
                child: DelayedWidget(
                  delayDuration: const Duration(milliseconds: 1000),
                  from: DelayFrom.right,
                  child: SelectableText.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                            text:'${DataValues.headerGreetings}\n',
                          style: TextStyle(
                            fontSize: ((titleSize ?? 30) - 10),
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            letterSpacing: 4.0,
                            fontFamily: 'Ubuntu',
                          ),
                        ),
                        TextSpan(
                          text: DataValues.headerName,
                          style: TextStyle(
                            fontSize: titleSize,
                            fontWeight: FontWeight.bold,
                            color: context.primaryColor,
                            letterSpacing: 4.0,
                            fontFamily: 'Ubuntu',
                          ),
                        )
                      ],
                    ),
                    style: TextStyle(
                      fontSize: titleSize,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 4.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 22.0),

          // Divider between
          const DelayedWidget(
            delayDuration: Duration(milliseconds: 1400),
            from: DelayFrom.top,
            child: Divider(
              thickness: 1.75,
              color: dividerColor,
            ),
          ),
          const SizedBox(height: 30.0),

          // Text: "FLUTTER BY DAY, FLUTTER BY NIGHT (INCLUDING WEEKENDS)"
          DelayedWidget(
            delayDuration: const Duration(milliseconds: 1500),
            from: DelayFrom.top,
            child: SelectableText(
              DataValues.appDescription,
              textAlign: mottoTextAlignment,
              style: TextStyle(
                fontSize: mottoSize,
                fontWeight: FontWeight.w400,
                color: Colors.white,
                letterSpacing: 1.8,
                fontFamily: 'Ubuntu',
              ),
            ),
          ),
          const SizedBox(height: 40.0),

          // Obvious from its name :)
          const SocialMediaButtons()
        ],
      ),
    );
  }
}
