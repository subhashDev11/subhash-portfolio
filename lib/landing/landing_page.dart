import 'package:flutter/material.dart';
import 'package:subhash_dev/configue.dart';
import 'package:subhash_dev/desktop/ds_1_header.dart';
import 'package:subhash_dev/landing/widgets/landing_body.dart';
import 'package:subhash_dev/landing/widgets/scroll_up_indicator.dart';
import 'package:subhash_dev/widgets/nav_bar.dart';

const dividerColor = Color(0xFF464751);
const primaryColor = Color.fromRGBO(47, 49, 64, 1.0);
const cardColor = Color.fromRGBO(54, 56, 72, 1.0);

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      drawer: context.isDesktop ? null : NavBar().mobileNavBar(),
      // Stack widgets on top of each other
      body: Stack(
        children: [
          // For better control on the web, we supply our ScrollController to
          // both parent Scrollbar and child SingleChildScrollView widgets.
          Scrollbar(
            controller: _scrollController,
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  // Header with texts and social media buttons.
                  LandingHeader(_scrollController),
                  context.isDesktop
                  ?
                  NavBar().desktopNavBar(): const SizedBox(),
                  const SizedBox(height: 10.0),
                  const LandingBody(),
                ],
              ),
            ),
          ),

          ScrollUpIndicator(_scrollController),
        ],
      ),
    );
  }
}


