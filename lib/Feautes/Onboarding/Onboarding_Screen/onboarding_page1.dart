import 'package:burando/Core/Contants/app_text_styles.dart';
import 'package:burando/Core/Contants/assets.dart';
import 'package:burando/Feautes/Onboarding/Widget/AnimatedCard.dart';
import 'package:burando/Localization/flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class OnboardingPage1 extends StatefulWidget {
  const OnboardingPage1({super.key});
  @override
  State<OnboardingPage1> createState() => _OnboardingPage2State();
}

class _OnboardingPage2State extends State<OnboardingPage1> {
  bool _showCard = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(milliseconds: 350),
          () => setState(() => _showCard = true),
    );
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var localization = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: const Color(0xff05142A),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            Assets.onboarding_background,
            fit: BoxFit.fill,
            height: double.infinity,
            width: double.infinity,
          ),

          // phone image
          Positioned(
            top: height * 0.15,
            child: Image.asset(Assets.phone_onboarding,width: width*0.9,),
          ),

          // card message
          Positioned(
            top: height * 0.1,
            child: AnimatedCard(
              showCard: _showCard,
              imagePath: Assets.message1_onboarding,
              width: width * 0.9,
              height: height * 0.4,
              duration: const Duration(milliseconds: 1000),
              initialScale: 0.8,
              curve: Curves.easeOutBack,
            ),
          ),

          // text section
          Positioned(
            top: height * 0.62,
            left: width * 0.02,
            right: width * 0.02,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.02), // بدل 15.h
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    localization.header_page2,
                    style: AppTextStyle.figtree_30_bold_white,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: height * 0.02),
                  Text(
                    localization.body_page2,
                    style: AppTextStyle.figtree_16_400w_white,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
