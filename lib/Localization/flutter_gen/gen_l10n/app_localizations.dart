import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'gen_l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
  ];

  /// No description provided for @welcome.
  ///
  /// In en, this message translates to:
  /// **'welcome To Burando'**
  String get welcome;

  /// No description provided for @body_welcome_page.
  ///
  /// In en, this message translates to:
  /// **'Whether you\'re building your own Brand or hunting for unique treasures, let\'s craft your story together!'**
  String get body_welcome_page;

  /// No description provided for @get_started.
  ///
  /// In en, this message translates to:
  /// **'Get Started'**
  String get get_started;

  /// No description provided for @header_page2.
  ///
  /// In en, this message translates to:
  /// **'Find Products You Love, And Buy It For Life'**
  String get header_page2;

  /// No description provided for @body_page2.
  ///
  /// In en, this message translates to:
  /// **'Discover quality items made to last, perfectly suited to your style.'**
  String get body_page2;

  /// No description provided for @header_page3.
  ///
  /// In en, this message translates to:
  /// **'Create Your\n Customizable Wishlist'**
  String get header_page3;

  /// No description provided for @body_page3.
  ///
  /// In en, this message translates to:
  /// **'Save and organize your favorite finds for easy access anytime.'**
  String get body_page3;

  /// No description provided for @header_page4.
  ///
  /// In en, this message translates to:
  /// **'Can’t Find What you\n want ?'**
  String get header_page4;

  /// No description provided for @body_page4.
  ///
  /// In en, this message translates to:
  /// **'Burando AI Shopping Assistant Is Here to help you find what you need and order it easily '**
  String get body_page4;

  /// No description provided for @header_page5.
  ///
  /// In en, this message translates to:
  /// **'Create Your Own Local brand'**
  String get header_page5;

  /// No description provided for @body_page5.
  ///
  /// In en, this message translates to:
  /// **' Start selling in minutes or browse endless unique products from top sellers. '**
  String get body_page5;

  /// No description provided for @header_page6.
  ///
  /// In en, this message translates to:
  /// **'Manage Payments & \nTrack Delivery Order'**
  String get header_page6;

  /// No description provided for @body_page6.
  ///
  /// In en, this message translates to:
  /// **'Keep tabs on payments and stay updated with real-time delivery tracking.'**
  String get body_page6;

  /// No description provided for @header_page7.
  ///
  /// In en, this message translates to:
  /// **'Get The Latest Deals.\n Save More, Spend Less'**
  String get header_page7;

  /// No description provided for @body_page7.
  ///
  /// In en, this message translates to:
  /// **'Access exclusive offers and maximize your savings every time you shop!'**
  String get body_page7;

  /// No description provided for @skip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get skip;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @back.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get back;

  /// No description provided for @finish.
  ///
  /// In en, this message translates to:
  /// **'Finish'**
  String get finish;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
