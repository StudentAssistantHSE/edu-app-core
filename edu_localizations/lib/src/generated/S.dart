import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'S_en.dart';
import 'S_ru.dart';

/// Callers can lookup localized strings with an instance of S
/// returned by `S.of(context)`.
///
/// Applications need to include `S.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/S.dart';
///
/// return MaterialApp(
///   localizationsDelegates: S.localizationsDelegates,
///   supportedLocales: S.supportedLocales,
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
/// be consistent with the languages listed in the S.supportedLocales
/// property.
abstract class S {
  S(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static S? of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  static const LocalizationsDelegate<S> delegate = _SDelegate();

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
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('ru')
  ];

  /// No description provided for @login_login_emailOrUsernameInputHint.
  ///
  /// In en, this message translates to:
  /// **'E-mail / username'**
  String get login_login_emailOrUsernameInputHint;

  /// No description provided for @login_login_passwordInputHint.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get login_login_passwordInputHint;

  /// No description provided for @login_login_submitLoginButtonText.
  ///
  /// In en, this message translates to:
  /// **'Sign in'**
  String get login_login_submitLoginButtonText;

  /// No description provided for @login_login_pageTitle.
  ///
  /// In en, this message translates to:
  /// **'Signing in'**
  String get login_login_pageTitle;

  /// No description provided for @login_login_registrationButtonText.
  ///
  /// In en, this message translates to:
  /// **'Sign up'**
  String get login_login_registrationButtonText;

  /// No description provided for @login_login_passwordRecoveryButtonText.
  ///
  /// In en, this message translates to:
  /// **'Forgot password?'**
  String get login_login_passwordRecoveryButtonText;

  /// No description provided for @login_login_incorrectCredentialsMessage.
  ///
  /// In en, this message translates to:
  /// **'Incorrect credentials'**
  String get login_login_incorrectCredentialsMessage;

  /// No description provided for @login_login_accountDisabledMessage.
  ///
  /// In en, this message translates to:
  /// **'Your account was disabled. Please contact out support team'**
  String get login_login_accountDisabledMessage;

  /// No description provided for @login_login_noPrivilegesMessage.
  ///
  /// In en, this message translates to:
  /// **'You don\'t have the necessary permissions'**
  String get login_login_noPrivilegesMessage;

  /// No description provided for @login_login_connectionErrorMessage.
  ///
  /// In en, this message translates to:
  /// **'Connection error'**
  String get login_login_connectionErrorMessage;

  /// No description provided for @login_login_undefinedErrorMessage.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong'**
  String get login_login_undefinedErrorMessage;

  /// No description provided for @login_emailCode_pageTitle.
  ///
  /// In en, this message translates to:
  /// **'Signing in'**
  String get login_emailCode_pageTitle;

  /// No description provided for @login_emailCode_pageSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Enter the code that we have sent to your e-mail'**
  String get login_emailCode_pageSubtitle;

  /// No description provided for @login_emailCode_attemptsLeftMessage.
  ///
  /// In en, this message translates to:
  /// **'{current,plural, =1{1 attempt left} few{{current}/{max} attempts left} many{{current}/{max} attempts left} other{{current}/{max} attempts left}}'**
  String login_emailCode_attemptsLeftMessage(int current, int max);

  /// No description provided for @login_emailCode_invalidCodeMessage.
  ///
  /// In en, this message translates to:
  /// **'Invalid code'**
  String get login_emailCode_invalidCodeMessage;

  /// No description provided for @login_emailCode_noCodeMessage.
  ///
  /// In en, this message translates to:
  /// **'Attempts ended. Request a new code'**
  String get login_emailCode_noCodeMessage;

  /// No description provided for @login_emailCode_goToEmailButtonText.
  ///
  /// In en, this message translates to:
  /// **'Go to e-mail app'**
  String get login_emailCode_goToEmailButtonText;

  /// No description provided for @login_emailCode_pasteCodeDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'Insert code'**
  String get login_emailCode_pasteCodeDialogTitle;

  /// No description provided for @login_emailCode_pasteCodeDialogContent.
  ///
  /// In en, this message translates to:
  /// **'Insert code'**
  String get login_emailCode_pasteCodeDialogContent;

  /// No description provided for @login_emailCode_pasteCodeDialogAffirmativeActionText.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get login_emailCode_pasteCodeDialogAffirmativeActionText;

  /// No description provided for @login_emailCode_pasteCodeDialogNegativeActionText.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get login_emailCode_pasteCodeDialogNegativeActionText;

  /// No description provided for @login_emailCode_chooseEmailAppToGoDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'Choose app'**
  String get login_emailCode_chooseEmailAppToGoDialogTitle;

  /// No description provided for @login_emailCode_resendCodeButtonText.
  ///
  /// In en, this message translates to:
  /// **'Send again'**
  String get login_emailCode_resendCodeButtonText;

  /// No description provided for @login_emailCode_failedToResendCodeMessage.
  ///
  /// In en, this message translates to:
  /// **'Failed to send code'**
  String get login_emailCode_failedToResendCodeMessage;

  /// No description provided for @login_emailCode_successfullyResentCodeMessage.
  ///
  /// In en, this message translates to:
  /// **'Code was successfully sent'**
  String get login_emailCode_successfullyResentCodeMessage;

  /// No description provided for @login_emailCode_connectionErrorMessage.
  ///
  /// In en, this message translates to:
  /// **'Connection error'**
  String get login_emailCode_connectionErrorMessage;

  /// No description provided for @login_emailCode_undefinedErrorMessage.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong'**
  String get login_emailCode_undefinedErrorMessage;

  /// No description provided for @registration_registration_pageTitle.
  ///
  /// In en, this message translates to:
  /// **'Sign up'**
  String get registration_registration_pageTitle;

  /// No description provided for @registration_registration_emailInputHint.
  ///
  /// In en, this message translates to:
  /// **'E-mail'**
  String get registration_registration_emailInputHint;

  /// No description provided for @registration_registration_usernameInputHint.
  ///
  /// In en, this message translates to:
  /// **'Username'**
  String get registration_registration_usernameInputHint;

  /// No description provided for @registration_registration_emailAlreadyUsedMessage.
  ///
  /// In en, this message translates to:
  /// **'Unavailable E-mail'**
  String get registration_registration_emailAlreadyUsedMessage;

  /// No description provided for @registration_registration_usernameAlreadyUsedMessage.
  ///
  /// In en, this message translates to:
  /// **'Unavailable username'**
  String get registration_registration_usernameAlreadyUsedMessage;

  /// No description provided for @registration_registration_birthdayYearInputHint.
  ///
  /// In en, this message translates to:
  /// **'Birthday year'**
  String get registration_registration_birthdayYearInputHint;

  /// No description provided for @registration_registration_genderInputHint.
  ///
  /// In en, this message translates to:
  /// **'Gender'**
  String get registration_registration_genderInputHint;

  /// No description provided for @registration_registration_passwordInputHint.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get registration_registration_passwordInputHint;

  /// No description provided for @registration_registration_repeatPasswordInputHint.
  ///
  /// In en, this message translates to:
  /// **'Repeat password'**
  String get registration_registration_repeatPasswordInputHint;

  /// No description provided for @registration_registration_usernameAllowedSymbolsDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'Username'**
  String get registration_registration_usernameAllowedSymbolsDialogTitle;

  /// No description provided for @registration_registration_usernameRequiredFromToSymbols.
  ///
  /// In en, this message translates to:
  /// **'From {from} to {to} symbols'**
  String registration_registration_usernameRequiredFromToSymbols(int from, int to);

  /// No description provided for @registration_registration_usernameAllowedSymbolsDialogLowercaseLatinLettersItem.
  ///
  /// In en, this message translates to:
  /// **'Lowercase latin letters a-z'**
  String get registration_registration_usernameAllowedSymbolsDialogLowercaseLatinLettersItem;

  /// No description provided for @registration_registration_usernameAllowedSymbolsDialogDigitsItem.
  ///
  /// In en, this message translates to:
  /// **'Digits'**
  String get registration_registration_usernameAllowedSymbolsDialogDigitsItem;

  /// No description provided for @registration_registration_usernameAllowedSymbolsDialogSpecialSymbolsItem.
  ///
  /// In en, this message translates to:
  /// **'Symbols \".\", \"_\"'**
  String get registration_registration_usernameAllowedSymbolsDialogSpecialSymbolsItem;

  /// No description provided for @registration_registration_usernameAllowedSymbolsDialogActionText.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get registration_registration_usernameAllowedSymbolsDialogActionText;

  /// No description provided for @registration_registration_nextStepButtonText.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get registration_registration_nextStepButtonText;

  /// No description provided for @registration_registration_passwordRequiredSymbolsDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get registration_registration_passwordRequiredSymbolsDialogTitle;

  /// No description provided for @registration_registration_passwordRequiredFromToSymbols.
  ///
  /// In en, this message translates to:
  /// **'From {from} to {to} symbols'**
  String registration_registration_passwordRequiredFromToSymbols(int from, int to);

  /// No description provided for @registration_registration_passwordRequiredSymbolsDialogLowercaseLatinLettersItem.
  ///
  /// In en, this message translates to:
  /// **'At least one lowercase latin letter a-z'**
  String get registration_registration_passwordRequiredSymbolsDialogLowercaseLatinLettersItem;

  /// No description provided for @registration_registration_passwordRequiredSymbolsDialogUppercaseLatinLettersItem.
  ///
  /// In en, this message translates to:
  /// **'At least one lowercase Latin letter A-Z'**
  String get registration_registration_passwordRequiredSymbolsDialogUppercaseLatinLettersItem;

  /// No description provided for @registration_registration_passwordRequiredSymbolsDialogDigitsItem.
  ///
  /// In en, this message translates to:
  /// **'At least one digit'**
  String get registration_registration_passwordRequiredSymbolsDialogDigitsItem;

  /// No description provided for @registration_registration_passwordRequiredSymbolsDialogActionText.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get registration_registration_passwordRequiredSymbolsDialogActionText;

  /// No description provided for @registration_registration_submitRegistrationButtonText.
  ///
  /// In en, this message translates to:
  /// **'Sign up'**
  String get registration_registration_submitRegistrationButtonText;

  /// No description provided for @registration_registration_noRepeatedPasswordMatchMessage.
  ///
  /// In en, this message translates to:
  /// **'Passwords don\'t match'**
  String get registration_registration_noRepeatedPasswordMatchMessage;

  /// No description provided for @registration_registration_filledIncorrectMessage.
  ///
  /// In en, this message translates to:
  /// **'Fields are filled in incorrectly'**
  String get registration_registration_filledIncorrectMessage;

  /// No description provided for @registration_registration_connectionErrorMessage.
  ///
  /// In en, this message translates to:
  /// **'Connection error'**
  String get registration_registration_connectionErrorMessage;

  /// No description provided for @registration_registration_undefinedErrorMessage.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong'**
  String get registration_registration_undefinedErrorMessage;

  /// No description provided for @registration_emailCode_pageTitle.
  ///
  /// In en, this message translates to:
  /// **'Just a little bit left'**
  String get registration_emailCode_pageTitle;

  /// No description provided for @registration_emailCode_pageSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Enter the code that we have sent to your e-mail'**
  String get registration_emailCode_pageSubtitle;

  /// No description provided for @registration_emailCode_attemptsLeftMessage.
  ///
  /// In en, this message translates to:
  /// **'{current,plural, =1{1 attempt left} few{{current}/{max} attempts left} many{{current}/{max} attempts left} other{{current}/{max} attempts left}}'**
  String registration_emailCode_attemptsLeftMessage(int current, int max);

  /// No description provided for @registration_emailCode_invalidCodeMessage.
  ///
  /// In en, this message translates to:
  /// **'Invalid code'**
  String get registration_emailCode_invalidCodeMessage;

  /// No description provided for @registration_emailCode_noCodeMessage.
  ///
  /// In en, this message translates to:
  /// **'Attempts ended. Request a new code'**
  String get registration_emailCode_noCodeMessage;

  /// No description provided for @registration_emailCode_goToEmailButtonText.
  ///
  /// In en, this message translates to:
  /// **'Go to e-mail app'**
  String get registration_emailCode_goToEmailButtonText;

  /// No description provided for @registration_emailCode_pasteCodeDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'Insert code'**
  String get registration_emailCode_pasteCodeDialogTitle;

  /// No description provided for @registration_emailCode_pasteCodeDialogContent.
  ///
  /// In en, this message translates to:
  /// **'Insert code'**
  String get registration_emailCode_pasteCodeDialogContent;

  /// No description provided for @registration_emailCode_pasteCodeDialogAffirmativeActionText.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get registration_emailCode_pasteCodeDialogAffirmativeActionText;

  /// No description provided for @registration_emailCode_pasteCodeDialogNegativeActionText.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get registration_emailCode_pasteCodeDialogNegativeActionText;

  /// No description provided for @registration_emailCode_chooseEmailAppToGoDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'Choose app'**
  String get registration_emailCode_chooseEmailAppToGoDialogTitle;

  /// No description provided for @registration_emailCode_resendCodeButtonText.
  ///
  /// In en, this message translates to:
  /// **'Send again'**
  String get registration_emailCode_resendCodeButtonText;

  /// No description provided for @registration_emailCode_failedToResendCodeMessage.
  ///
  /// In en, this message translates to:
  /// **'Failed to send code'**
  String get registration_emailCode_failedToResendCodeMessage;

  /// No description provided for @registration_emailCode_successfullyResentCodeMessage.
  ///
  /// In en, this message translates to:
  /// **'Code was successfully sent'**
  String get registration_emailCode_successfullyResentCodeMessage;

  /// No description provided for @registration_emailCode_connectionErrorMessage.
  ///
  /// In en, this message translates to:
  /// **'Connection error'**
  String get registration_emailCode_connectionErrorMessage;

  /// No description provided for @registration_emailCode_undefinedErrorMessage.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong'**
  String get registration_emailCode_undefinedErrorMessage;

  /// No description provided for @registration_finishRegistration_pageTitle.
  ///
  /// In en, this message translates to:
  /// **'Congratulations!'**
  String get registration_finishRegistration_pageTitle;

  /// No description provided for @registration_finishRegistration_pageSubtitle.
  ///
  /// In en, this message translates to:
  /// **'You have successfully signed up'**
  String get registration_finishRegistration_pageSubtitle;

  /// No description provided for @registration_finishRegistration_startButtonText.
  ///
  /// In en, this message translates to:
  /// **'Let\'s start'**
  String get registration_finishRegistration_startButtonText;

  /// No description provided for @passwordRecovery_passwordRecovery_pageTitle.
  ///
  /// In en, this message translates to:
  /// **'Password recovery'**
  String get passwordRecovery_passwordRecovery_pageTitle;

  /// No description provided for @passwordRecovery_passwordRecovery_emailOrUsernameInputHint.
  ///
  /// In en, this message translates to:
  /// **'E-mail / username'**
  String get passwordRecovery_passwordRecovery_emailOrUsernameInputHint;

  /// No description provided for @passwordRecovery_passwordRecovery_passwordInputHint.
  ///
  /// In en, this message translates to:
  /// **'New password'**
  String get passwordRecovery_passwordRecovery_passwordInputHint;

  /// No description provided for @passwordRecovery_passwordRecovery_repeatPasswordInputHint.
  ///
  /// In en, this message translates to:
  /// **'Repeat password'**
  String get passwordRecovery_passwordRecovery_repeatPasswordInputHint;

  /// No description provided for @passwordRecovery_passwordRecovery_submitRecoverButtonText.
  ///
  /// In en, this message translates to:
  /// **'Recover'**
  String get passwordRecovery_passwordRecovery_submitRecoverButtonText;

  /// No description provided for @passwordRecovery_passwordRecovery_passwordRequiredSymbolsDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get passwordRecovery_passwordRecovery_passwordRequiredSymbolsDialogTitle;

  /// No description provided for @passwordRecovery_passwordRecovery_passwordRequiredFromToSymbols.
  ///
  /// In en, this message translates to:
  /// **'From {from} to {to} symbols'**
  String passwordRecovery_passwordRecovery_passwordRequiredFromToSymbols(int from, int to);

  /// No description provided for @passwordRecovery_passwordRecovery_passwordRequiredSymbolsDialogLowercaseLatinLettersItem.
  ///
  /// In en, this message translates to:
  /// **'At least one lowercase latin letter a-z'**
  String get passwordRecovery_passwordRecovery_passwordRequiredSymbolsDialogLowercaseLatinLettersItem;

  /// No description provided for @passwordRecovery_passwordRecovery_passwordRequiredSymbolsDialogUppercaseLatinLettersItem.
  ///
  /// In en, this message translates to:
  /// **'At least one lowercase Latin letter A-Z'**
  String get passwordRecovery_passwordRecovery_passwordRequiredSymbolsDialogUppercaseLatinLettersItem;

  /// No description provided for @passwordRecovery_passwordRecovery_passwordRequiredSymbolsDialogDigitsItem.
  ///
  /// In en, this message translates to:
  /// **'At least one digit'**
  String get passwordRecovery_passwordRecovery_passwordRequiredSymbolsDialogDigitsItem;

  /// No description provided for @passwordRecovery_passwordRecovery_passwordRequiredSymbolsDialogActionText.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get passwordRecovery_passwordRecovery_passwordRequiredSymbolsDialogActionText;

  /// No description provided for @passwordRecovery_passwordRecovery_noRepeatedPasswordMatchMessage.
  ///
  /// In en, this message translates to:
  /// **'Passwords don\'t match'**
  String get passwordRecovery_passwordRecovery_noRepeatedPasswordMatchMessage;

  /// No description provided for @passwordRecovery_passwordRecovery_connectionErrorMessage.
  ///
  /// In en, this message translates to:
  /// **'Connection error'**
  String get passwordRecovery_passwordRecovery_connectionErrorMessage;

  /// No description provided for @passwordRecovery_passwordRecovery_undefinedErrorMessage.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong'**
  String get passwordRecovery_passwordRecovery_undefinedErrorMessage;

  /// No description provided for @passwordRecovery_emailCode_pageTitle.
  ///
  /// In en, this message translates to:
  /// **'Password recovery'**
  String get passwordRecovery_emailCode_pageTitle;

  /// No description provided for @passwordRecovery_emailCode_pageSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Enter the code that we have sent to your e-mail'**
  String get passwordRecovery_emailCode_pageSubtitle;

  /// No description provided for @passwordRecovery_emailCode_attemptsLeftMessage.
  ///
  /// In en, this message translates to:
  /// **'{current,plural, =1{1 attempt left} few{{current}/{max} attempts left} many{{current}/{max} attempts left} other{{current}/{max} attempts left}}'**
  String passwordRecovery_emailCode_attemptsLeftMessage(int current, int max);

  /// No description provided for @passwordRecovery_emailCode_invalidCodeMessage.
  ///
  /// In en, this message translates to:
  /// **'Invalid code'**
  String get passwordRecovery_emailCode_invalidCodeMessage;

  /// No description provided for @passwordRecovery_emailCode_noCodeMessage.
  ///
  /// In en, this message translates to:
  /// **'Attempts ended. Request a new code'**
  String get passwordRecovery_emailCode_noCodeMessage;

  /// No description provided for @passwordRecovery_emailCode_goToEmailButtonText.
  ///
  /// In en, this message translates to:
  /// **'Go to e-mail app'**
  String get passwordRecovery_emailCode_goToEmailButtonText;

  /// No description provided for @passwordRecovery_emailCode_pasteCodeDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'Insert code'**
  String get passwordRecovery_emailCode_pasteCodeDialogTitle;

  /// No description provided for @passwordRecovery_emailCode_pasteCodeDialogContent.
  ///
  /// In en, this message translates to:
  /// **'Insert code'**
  String get passwordRecovery_emailCode_pasteCodeDialogContent;

  /// No description provided for @passwordRecovery_emailCode_pasteCodeDialogAffirmativeActionText.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get passwordRecovery_emailCode_pasteCodeDialogAffirmativeActionText;

  /// No description provided for @passwordRecovery_emailCode_pasteCodeDialogNegativeActionText.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get passwordRecovery_emailCode_pasteCodeDialogNegativeActionText;

  /// No description provided for @passwordRecovery_emailCode_chooseEmailAppToGoDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'Choose app'**
  String get passwordRecovery_emailCode_chooseEmailAppToGoDialogTitle;

  /// No description provided for @passwordRecovery_emailCode_resendCodeButtonText.
  ///
  /// In en, this message translates to:
  /// **'Send again'**
  String get passwordRecovery_emailCode_resendCodeButtonText;

  /// No description provided for @passwordRecovery_emailCode_failedToResendCodeMessage.
  ///
  /// In en, this message translates to:
  /// **'Failed to send code'**
  String get passwordRecovery_emailCode_failedToResendCodeMessage;

  /// No description provided for @passwordRecovery_emailCode_successfullyResentCodeMessage.
  ///
  /// In en, this message translates to:
  /// **'Code was successfully sent'**
  String get passwordRecovery_emailCode_successfullyResentCodeMessage;

  /// No description provided for @passwordRecovery_emailCode_connectionErrorMessage.
  ///
  /// In en, this message translates to:
  /// **'Connection error'**
  String get passwordRecovery_emailCode_connectionErrorMessage;

  /// No description provided for @passwordRecovery_emailCode_undefinedErrorMessage.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong'**
  String get passwordRecovery_emailCode_undefinedErrorMessage;

  /// No description provided for @root_bottomNavigationBar_feedLabel.
  ///
  /// In en, this message translates to:
  /// **'Feed'**
  String get root_bottomNavigationBar_feedLabel;

  /// No description provided for @root_bottomNavigationBar_searchLabel.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get root_bottomNavigationBar_searchLabel;

  /// No description provided for @root_bottomNavigationBar_homeLabel.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get root_bottomNavigationBar_homeLabel;

  /// No description provided for @root_bottomNavigationBar_catalogLabel.
  ///
  /// In en, this message translates to:
  /// **'Catalog'**
  String get root_bottomNavigationBar_catalogLabel;

  /// No description provided for @root_bottomNavigationBar_userLabel.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get root_bottomNavigationBar_userLabel;

  /// No description provided for @root_home_curtainHeaderTemperatureCelsiusText.
  ///
  /// In en, this message translates to:
  /// **'{temperature} °C'**
  String root_home_curtainHeaderTemperatureCelsiusText(String temperature);

  /// No description provided for @root_home_curtainHeaderTemperatureFahrenheitText.
  ///
  /// In en, this message translates to:
  /// **'{temperature} °F'**
  String root_home_curtainHeaderTemperatureFahrenheitText(String temperature);

  /// No description provided for @root_home_curtainHeaderDateJanuary.
  ///
  /// In en, this message translates to:
  /// **'January {day}'**
  String root_home_curtainHeaderDateJanuary(int day);

  /// No description provided for @root_home_curtainHeaderDateFebruary.
  ///
  /// In en, this message translates to:
  /// **'February {day}'**
  String root_home_curtainHeaderDateFebruary(int day);

  /// No description provided for @root_home_curtainHeaderDateMarch.
  ///
  /// In en, this message translates to:
  /// **'March {day}'**
  String root_home_curtainHeaderDateMarch(int day);

  /// No description provided for @root_home_curtainHeaderDateApril.
  ///
  /// In en, this message translates to:
  /// **'April {day}'**
  String root_home_curtainHeaderDateApril(int day);

  /// No description provided for @root_home_curtainHeaderDateMay.
  ///
  /// In en, this message translates to:
  /// **'May {day}'**
  String root_home_curtainHeaderDateMay(int day);

  /// No description provided for @root_home_curtainHeaderDateJune.
  ///
  /// In en, this message translates to:
  /// **'June {day}'**
  String root_home_curtainHeaderDateJune(int day);

  /// No description provided for @root_home_curtainHeaderDateJuly.
  ///
  /// In en, this message translates to:
  /// **'July {day}'**
  String root_home_curtainHeaderDateJuly(int day);

  /// No description provided for @root_home_curtainHeaderDateAugust.
  ///
  /// In en, this message translates to:
  /// **'August {day}'**
  String root_home_curtainHeaderDateAugust(int day);

  /// No description provided for @root_home_curtainHeaderDateSeptember.
  ///
  /// In en, this message translates to:
  /// **'September {day}'**
  String root_home_curtainHeaderDateSeptember(int day);

  /// No description provided for @root_home_curtainHeaderDateOctober.
  ///
  /// In en, this message translates to:
  /// **'October {day}'**
  String root_home_curtainHeaderDateOctober(int day);

  /// No description provided for @root_home_curtainHeaderDateNovember.
  ///
  /// In en, this message translates to:
  /// **'November {day}'**
  String root_home_curtainHeaderDateNovember(int day);

  /// No description provided for @root_home_curtainHeaderDateDecember.
  ///
  /// In en, this message translates to:
  /// **'December {day}'**
  String root_home_curtainHeaderDateDecember(int day);

  /// No description provided for @root_home_curtainContentTitle.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get root_home_curtainContentTitle;

  /// No description provided for @root_home_curtainContentTemperatureCelsiusText.
  ///
  /// In en, this message translates to:
  /// **'{temperature}°C'**
  String root_home_curtainContentTemperatureCelsiusText(String temperature);

  /// No description provided for @root_home_curtainContentTemperatureFahrenheitText.
  ///
  /// In en, this message translates to:
  /// **'{temperature}°F'**
  String root_home_curtainContentTemperatureFahrenheitText(String temperature);

  /// No description provided for @root_home_curtainContentFeelsLikeTemperatureCelsiusText.
  ///
  /// In en, this message translates to:
  /// **'Feels like {temperature}°C'**
  String root_home_curtainContentFeelsLikeTemperatureCelsiusText(String temperature);

  /// No description provided for @root_home_curtainContentFeelsLikeTemperatureFahrenheitText.
  ///
  /// In en, this message translates to:
  /// **'Feels like {temperature}°F'**
  String root_home_curtainContentFeelsLikeTemperatureFahrenheitText(String temperature);

  /// No description provided for @root_home_curtainContentPrecipitationsTitle.
  ///
  /// In en, this message translates to:
  /// **'Precipitations'**
  String get root_home_curtainContentPrecipitationsTitle;

  /// No description provided for @root_home_curtainContentPrecipitationsValueMetricText.
  ///
  /// In en, this message translates to:
  /// **'{precipitations} mm'**
  String root_home_curtainContentPrecipitationsValueMetricText(int precipitations);

  /// No description provided for @root_home_curtainContentPrecipitationsValueImperialText.
  ///
  /// In en, this message translates to:
  /// **'{precipitations} in'**
  String root_home_curtainContentPrecipitationsValueImperialText(Object precipitations);

  /// No description provided for @root_home_curtainContentHumidityTitle.
  ///
  /// In en, this message translates to:
  /// **'Humidity'**
  String get root_home_curtainContentHumidityTitle;

  /// No description provided for @root_home_curtainContentHumidityValueText.
  ///
  /// In en, this message translates to:
  /// **'{humidity}%'**
  String root_home_curtainContentHumidityValueText(int humidity);

  /// No description provided for @root_home_curtainContentWindSpeedTitle.
  ///
  /// In en, this message translates to:
  /// **'Wind'**
  String get root_home_curtainContentWindSpeedTitle;

  /// No description provided for @root_home_curtainContentWindSpeedValueMetricText.
  ///
  /// In en, this message translates to:
  /// **'{windSpeed} m/s'**
  String root_home_curtainContentWindSpeedValueMetricText(int windSpeed);

  /// No description provided for @root_home_curtainContentWindSpeedValueImperialText.
  ///
  /// In en, this message translates to:
  /// **'{windSpeed} m/h'**
  String root_home_curtainContentWindSpeedValueImperialText(int windSpeed);

  /// No description provided for @root_home_curtainContentPressureTitle.
  ///
  /// In en, this message translates to:
  /// **'Pressure'**
  String get root_home_curtainContentPressureTitle;

  /// No description provided for @root_home_curtainContentPressureValueMetricText.
  ///
  /// In en, this message translates to:
  /// **'{pressure} mm Hg'**
  String root_home_curtainContentPressureValueMetricText(int pressure);

  /// No description provided for @root_home_curtainContentPressureValueImperialText.
  ///
  /// In en, this message translates to:
  /// **'{pressure} in Hg'**
  String root_home_curtainContentPressureValueImperialText(Object pressure);

  /// No description provided for @root_home_curtainContentWeatherForecastTitle.
  ///
  /// In en, this message translates to:
  /// **'{days,plural, =1{Weather for 1 day} few{Weather for {days} days} many{Weather for {days} days} other{Weather for {days} days}}'**
  String root_home_curtainContentWeatherForecastTitle(int days);

  /// No description provided for @root_home_curtainContentWeatherForecastItemDaysOfWeekAbbreviationsMonday.
  ///
  /// In en, this message translates to:
  /// **'Mo'**
  String get root_home_curtainContentWeatherForecastItemDaysOfWeekAbbreviationsMonday;

  /// No description provided for @root_home_curtainContentWeatherForecastItemDaysOfWeekAbbreviationsTuesday.
  ///
  /// In en, this message translates to:
  /// **'Tu'**
  String get root_home_curtainContentWeatherForecastItemDaysOfWeekAbbreviationsTuesday;

  /// No description provided for @root_home_curtainContentWeatherForecastItemDaysOfWeekAbbreviationsWednesday.
  ///
  /// In en, this message translates to:
  /// **'We'**
  String get root_home_curtainContentWeatherForecastItemDaysOfWeekAbbreviationsWednesday;

  /// No description provided for @root_home_curtainContentWeatherForecastItemDaysOfWeekAbbreviationsThursday.
  ///
  /// In en, this message translates to:
  /// **'Th'**
  String get root_home_curtainContentWeatherForecastItemDaysOfWeekAbbreviationsThursday;

  /// No description provided for @root_home_curtainContentWeatherForecastItemDaysOfWeekAbbreviationsFriday.
  ///
  /// In en, this message translates to:
  /// **'Fr'**
  String get root_home_curtainContentWeatherForecastItemDaysOfWeekAbbreviationsFriday;

  /// No description provided for @root_home_curtainContentWeatherForecastItemDaysOfWeekAbbreviationsSaturday.
  ///
  /// In en, this message translates to:
  /// **'Sa'**
  String get root_home_curtainContentWeatherForecastItemDaysOfWeekAbbreviationsSaturday;

  /// No description provided for @root_home_curtainContentWeatherForecastItemDaysOfWeekAbbreviationsSunday.
  ///
  /// In en, this message translates to:
  /// **'Su'**
  String get root_home_curtainContentWeatherForecastItemDaysOfWeekAbbreviationsSunday;

  /// No description provided for @root_home_curtainContentWeatherForecastItemTemperatureCelsiusText.
  ///
  /// In en, this message translates to:
  /// **'{temperature}°C'**
  String root_home_curtainContentWeatherForecastItemTemperatureCelsiusText(String temperature);

  /// No description provided for @root_home_curtainContentWeatherForecastItemTemperatureFahrenheitText.
  ///
  /// In en, this message translates to:
  /// **'{temperature}°F'**
  String root_home_curtainContentWeatherForecastItemTemperatureFahrenheitText(String temperature);

  /// No description provided for @root_home_curtainContentWeatherForecastItemFeelsLikeTemperatureCelsiusText.
  ///
  /// In en, this message translates to:
  /// **'{temperature}°C'**
  String root_home_curtainContentWeatherForecastItemFeelsLikeTemperatureCelsiusText(String temperature);

  /// No description provided for @root_home_curtainContentWeatherForecastItemFeelsLikeTemperatureFahrenheitText.
  ///
  /// In en, this message translates to:
  /// **'{temperature}°F'**
  String root_home_curtainContentWeatherForecastItemFeelsLikeTemperatureFahrenheitText(String temperature);

  /// No description provided for @root_home_weatherLoadingConnectionErrorMessage.
  ///
  /// In en, this message translates to:
  /// **'No internet connection'**
  String get root_home_weatherLoadingConnectionErrorMessage;

  /// No description provided for @root_home_weatherLoadingUndefinedErrorMessageTitle.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong'**
  String get root_home_weatherLoadingUndefinedErrorMessageTitle;

  /// No description provided for @root_home_weatherLoadingUndefinedErrorMessageSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Technical error, we are solving the issue'**
  String get root_home_weatherLoadingUndefinedErrorMessageSubtitle;

  /// No description provided for @root_home_weatherLoadingTryAgainButtonText.
  ///
  /// In en, this message translates to:
  /// **'Try again'**
  String get root_home_weatherLoadingTryAgainButtonText;

  /// No description provided for @root_home_choicesLoadingConnectionErrorMessage.
  ///
  /// In en, this message translates to:
  /// **'No internet connection'**
  String get root_home_choicesLoadingConnectionErrorMessage;

  /// No description provided for @root_home_choicesLoadingUndefinedErrorMessageTitle.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong'**
  String get root_home_choicesLoadingUndefinedErrorMessageTitle;

  /// No description provided for @root_home_choicesLoadingUndefinedErrorMessageSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Technical error, we are solving the issue'**
  String get root_home_choicesLoadingUndefinedErrorMessageSubtitle;

  /// No description provided for @root_home_choicesLoadingTryAgainButtonText.
  ///
  /// In en, this message translates to:
  /// **'Try again'**
  String get root_home_choicesLoadingTryAgainButtonText;

  /// No description provided for @root_user_looksCountText.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{Look} other{Looks}}'**
  String root_user_looksCountText(int count);

  /// No description provided for @root_user_followersCountText.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{Follower} other{Followers}}'**
  String root_user_followersCountText(int count);

  /// No description provided for @root_user_followsCountText.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{Follow} other{Follows}}'**
  String root_user_followsCountText(int count);

  /// No description provided for @root_followers_search_input_hint.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get root_followers_search_input_hint;

  /// No description provided for @root_follows_search_input_hint.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get root_follows_search_input_hint;

  /// No description provided for @common_lists_loadingConnectionErrorMessage.
  ///
  /// In en, this message translates to:
  /// **'No internet connection'**
  String get common_lists_loadingConnectionErrorMessage;

  /// No description provided for @common_lists_loadingUndefinedErrorMessageTitle.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong'**
  String get common_lists_loadingUndefinedErrorMessageTitle;

  /// No description provided for @common_lists_loadingUndefinedErrorMessageSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Technical error, we are solving the issue'**
  String get common_lists_loadingUndefinedErrorMessageSubtitle;

  /// No description provided for @common_lists_loadingTryAgainButtonText.
  ///
  /// In en, this message translates to:
  /// **'Try again'**
  String get common_lists_loadingTryAgainButtonText;
}

class _SDelegate extends LocalizationsDelegate<S> {
  const _SDelegate();

  @override
  Future<S> load(Locale locale) {
    return SynchronousFuture<S>(lookupS(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'ru'].contains(locale.languageCode);

  @override
  bool shouldReload(_SDelegate old) => false;
}

S lookupS(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return SEn();
    case 'ru': return SRu();
  }

  throw FlutterError(
    'S.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
