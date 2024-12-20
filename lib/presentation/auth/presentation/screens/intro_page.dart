import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:track_it/core/cosntants.dart';
import 'package:track_it/core/router.dart';
import 'package:track_it/presentation/widget/buttons.dart';
import 'package:track_it/presentation/widget/general_widgets.dart';

class IntroPages extends StatelessWidget {
  IntroPages({super.key});

  final PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.blueColor,
      body: Stack(
        children: [
          const MainBackground(),
          Align(
            alignment: Alignment.bottomCenter,
            child: _introSildes(context: context),
          ),
        ],
      ),
    );
  }

  _introSildes({
    required BuildContext context,
  }) {
    List<Widget> introSlides = [
      _itemList(
        oneTxt: 'You',
        twoTxt: 'Should Know',
        threeTxt: 'What you Eat',
        desc:
            'Gain insights in your nutritional habits with detailed statistics',
      ),
      _itemList(
        oneTxt: 'Track',
        twoTxt: 'Your',
        threeTxt: 'Diet',
        desc: 'We will help you lose weight, stay fit, or build muscle',
      ),
      _itemList(
        oneTxt: 'Live',
        twoTxt: 'Healthy',
        threeTxt: '& Great',
        desc: 'Let’s start this journey and live healty together!',
      ),
    ];

    return Padding(
      padding: parentPadding,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(child: const Center(child: LogoWidget())),
          SizedBox(
            height: 200,
            child: PageView.builder(
                controller: controller,
                itemCount: introSlides.length,
                pageSnapping: true,
                itemBuilder: (context, pagePosition) {
                  return introSlides[pagePosition];
                }),
          ),
          SizedBox(
            height: 12,
            child: SmoothPageIndicator(
              controller: controller,
              count: introSlides.length,
              axisDirection: Axis.horizontal,
              effect: const ExpandingDotsEffect(
                  activeDotColor: CustomColors.yellowColor),
            ),
          ),
          SizedBox(
            height: 28,
          ),
          PrimaryButton(
            onPressed: () {
              context.pushNamed(
                RouterConstants.loginPage,
              );
            },
            label: 'Get Started',
          ),
        ],
      ),
    );
  }

  _itemList({
    required String oneTxt,
    required String twoTxt,
    required String threeTxt,
    required String desc,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          textAlign: TextAlign.start,
          text: TextSpan(
            style: const TextStyle(
              color: CustomColors.whiteColor,
              fontSize: 36,
              fontFamily: FontFamily.poppins,
              fontWeight: FontWeight.w700,
            ),
            children: [
              TextSpan(
                text: oneTxt,
              ),
              TextSpan(
                text: '\t$twoTxt',
                style: const TextStyle(
                  color: CustomColors.yellowColor,
                ),
              ),
              TextSpan(
                text: '\t$threeTxt',
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 6,
        ),
        RichText(
          text: TextSpan(
            text: desc,
            style: const TextStyle(
              color: CustomColors.whiteColor,
              fontSize: 20,
              fontFamily: FontFamily.dmSans,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
