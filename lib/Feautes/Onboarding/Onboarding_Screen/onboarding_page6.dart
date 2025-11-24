import 'package:burando/Core/Contants/app_text_styles.dart';
import 'package:burando/Core/Contants/assets.dart';
import 'package:burando/Localization/flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import '../Widget/AnimatedCard.dart';

class OnboardingPage6 extends StatefulWidget {
  const OnboardingPage6({super.key});
  @override
  State<OnboardingPage6> createState() => _OnboardingPage2State();
}

class _OnboardingPage2State extends State<OnboardingPage6> {
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
    var localization = AppLocalizations.of(context)!;
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
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

          //phone image
          Positioned(
            top: height * 0.15,
            child: Image.asset(Assets.phone_onboarding,width: width*0.9,),
          ),
          Positioned(
            top:height*0.11 ,

            child: AnimatedCard(
              showCard: _showCard,
              imagePath: Assets.message7_onboarding,
              width: width*0.9,
              height: height*0.5,
              duration: const Duration(milliseconds: 1000),
              initialScale: 0.8,
              curve: Curves.easeOutBack,
            ),
          ),

          Positioned(
            top: height * 0.62,
            left: width * 0.02,
            right: width * 0.02,

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  localization.header_page7,
                  style: AppTextStyle.figtree_30_bold_white,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: height*0.02),
                Text(
                  localization.body_page7,
                  style: AppTextStyle.figtree_16_400w_white,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
