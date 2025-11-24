import 'package:burando/Core/Contants/app_colors.dart';
import 'package:burando/Core/Contants/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Localization/flutter_gen/gen_l10n/app_localizations.dart';
import '../home.dart';
import 'Onboarding_Screen/onboarding_page3.dart';
import 'Onboarding_Screen/onboarding_page4.dart';
import 'welcome_page.dart';
import 'Onboarding_Screen/onboarding_page1.dart';
import 'Onboarding_Screen/onboarding_page2.dart';
import 'Onboarding_Screen/onboarding_page5.dart';
import 'Onboarding_Screen/onboarding_page6.dart';
import '../../Core/Contants/assets.dart';


class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _currentIndex = 0;
  bool _welcomePassed = false;
  static const int totalPages = 6;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  //Shard pref method
  Future<void> _completeOnboarding() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('seenOnboarding', true);
    if (!mounted) return;
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const HomeScreen()),
    );
  }

  //get started method button
  void _onGetStarted() {
    setState(() {
      _welcomePassed = true;
      _currentIndex = 0;
    });
  }

  // next method button
  void _goNext() {
    if (_currentIndex == totalPages - 1) {
      _completeOnboarding();
    } else {
      _controller.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  // back method button
  void _goBack() {
    if (_currentIndex > 0) {
      _controller.previousPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }
//---------------------------------------------------------------------------------------//
  // ui of Screen
  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context);
    final isRtl = Directionality.of(context) == TextDirection.rtl;
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    // if welcome Screen not pass
    if (!_welcomePassed) {
      return WelcomeScreen(onGetStarted: _onGetStarted);
    }

    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            physics: const ClampingScrollPhysics(),
            onPageChanged: (index) => setState(() => _currentIndex = index),
            children: const [
              OnboardingPage1(),
              OnboardingPage2(),
              OnboardingPage3(),
              OnboardingPage4(),
              OnboardingPage5(),
              OnboardingPage6(),
            ],
          ),

          // Skip Button
          if (_currentIndex < totalPages - 1)
            Positioned(
              top: height * 0.05,
              right: isRtl ? null : width * 0.05,
              left: isRtl ? width * 0.05 : null,
              child: TextButton(
                onPressed:(){
                  _controller.animateToPage(
                    totalPages - 1,
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeInOut,
                  );
              } ,
                child: Text(
                  localization!.skip,
                  style: AppTextStyle.figtree_22_bold_white,
                ),
              ),
            ),

          Positioned(
            bottom: height * 0.05,
            left: width * 0.05,
            right: width * 0.05,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //Back Button
                if (_currentIndex > 0)
                  InkWell(
                    onTap: _goBack,
                    child: Container(
                      height: height * 0.08,
                      width: width * 0.18,
                      decoration: BoxDecoration(
                        color: AppColors.wight,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Image.asset(
                        isRtl
                            ? Assets.forward_arrow
                            : Assets.back_forward_arrow,
                        height: height * 0.08,
                        width: width * 0.18,
                      ),
                    ),
                  )
                else
                  SizedBox(width: width * 0.18),

                // Indicator
                if (_currentIndex != totalPages - 1)
                  SmoothPageIndicator(
                    controller: _controller,
                    count: totalPages,
                    effect: WormEffect(
                      dotHeight: 8,
                      dotWidth: 8,
                      activeDotColor: AppColors.wight,
                      strokeWidth: 12,
                      dotColor: Colors.white24,
                    ),
                  )
                else
                  SizedBox(width: width * 0.01),

                InkWell(
                  onTap: _goNext,
                  child: _currentIndex == totalPages - 1
                      ? Container(
                          height: height * 0.08,
                          width: width * 0.5,
                          decoration: BoxDecoration(
                            color: AppColors.wight,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.only(
                                  start: 43,
                                ),
                                child: Text(
                                  localization!.finish,
                                  style: AppTextStyle.inter_24_600w_Black,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: width * 0.01,
                                ),
                                child: Image.asset(
                                  isRtl
                                      ? Assets.back_forward_arrow
                                      : Assets.forward_arrow,
                                  height: height * 0.08,
                                  width: width * 0.16,
                                ),
                              ),
                            ],
                          ),
                        )
                      : Container(
                          height: height * 0.08,
                          width: width * 0.18,
                          decoration: BoxDecoration(
                            color: AppColors.wight,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Image.asset(
                            isRtl
                                ? Assets.back_forward_arrow
                                : Assets.forward_arrow,
                            height: height * 0.08,
                            width: width * 0.18,
                          ),
                        ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
