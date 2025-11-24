import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:device_preview/device_preview.dart';
import 'Feautes/Onboarding/onboarding_screen.dart';
import 'Feautes/home.dart';
import 'Core/Services/language_service.dart';
import 'Localization/flutter_gen/gen_l10n/app_localizations.dart';
import 'Routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();


  final prefs = await SharedPreferences.getInstance();
  final bool seenOnboarding = prefs.getBool('seenOnboarding') ?? false;

  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => ChangeNotifierProvider(
        create: (_) => AppLanguageProvider(),
        child: MyApp(seenOnboarding: seenOnboarding),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  final bool seenOnboarding;
  const MyApp({super.key, required this.seenOnboarding});

  @override
  Widget build(BuildContext context) {
    final appLanguageProvider = Provider.of<AppLanguageProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      useInheritedMediaQuery: true,
      locale: appLanguageProvider.appLanguage,
      builder: DevicePreview.appBuilder,
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: AppLocalizations.localizationsDelegates,

      routes: {
        AppRoutes.onboarding_screen: (_) => const OnboardingScreen(),
        HomeScreen.routeName: (_) => const HomeScreen(),
      },

      initialRoute: seenOnboarding
          ? HomeScreen.routeName
          : AppRoutes.onboarding_screen,
    );
  }
}
