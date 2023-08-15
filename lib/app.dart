import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:responsive_framework/utils/scroll_behavior.dart';
import 'package:subhash_dev/landing/landing_page.dart';
import 'package:subhash_dev/theme/app_theme.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Subhash Chandra Shukla'.toUpperCase(),

      // Initializing responsive_framework here.
      builder: (context, child) {
        return ResponsiveWrapper.builder(
          BouncingScrollWrapper.builder(context, child!),
          minWidth: 300,
          debugLog: true,
          defaultScale: true,
          breakpoints: [
            const ResponsiveBreakpoint.autoScaleDown(450, name: MOBILE),
            const ResponsiveBreakpoint.autoScale(800, name: TABLET),
            const ResponsiveBreakpoint.resize(1200, name: DESKTOP),
          ],
          background: Container(color: AppThemeData.primaryColor),
        );
      },
      home: const LandingScreen(),
      theme: ThemeData.dark().copyWith(
        primaryColor: AppThemeData.primaryColor,
        textTheme: Typography().white.apply(
            fontFamily: 'Ubuntu',
        ),
      ),
    );
  }
}
