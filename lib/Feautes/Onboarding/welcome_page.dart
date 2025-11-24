import 'package:burando/Core/Contants/app_colors.dart';
import 'package:burando/Core/Contants/app_text_styles.dart';
import 'package:burando/Core/Contants/assets.dart';
import 'package:burando/Localization/flutter_gen/gen_l10n/app_localizations.dart';
 import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WelcomeScreen extends StatelessWidget {
  final VoidCallback onGetStarted;
  const WelcomeScreen({super.key, required this.onGetStarted});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var localization =AppLocalizations.of(context);
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [

          Image.asset(
            Assets.welcome_screen,
            fit: BoxFit.cover,
          ),



            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                
                SizedBox(height: height*0.4),
                Image.asset(Assets.logo,width: width*0.08, height: height*0.08),
                SizedBox(height: height*0.04),

                Text(
                    localization!.welcome,
                   style:  AppTextStyle.figtree_30_bold_white,

                ),
                SizedBox(height: height*0.08),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal:width*0.015),
                  child: Text(
                     localization.body_welcome_page,
                    style:  AppTextStyle.figtree_16_400w_white,textAlign: TextAlign.center,

                  ),
                ),

                SizedBox(height: height*0.06),
                ElevatedButton(
                  onPressed: onGetStarted,
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    backgroundColor:AppColors.dark_blue,
                    padding: EdgeInsets.symmetric(horizontal: width*0.28, vertical: height*0.015),
                  ),
                  child:
                  Text(
                     localization.get_started,
                    style:AppTextStyle.inter_20_600w_white
                  ),
                )
              ],
           ),

        ],
      ),
    );
  }
}