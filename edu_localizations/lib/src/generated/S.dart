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

  /// No description provided for @login_login_incorrectCredentialsMessage.
  ///
  /// In en, this message translates to:
  /// **'Incorrect credentials'**
  String get login_login_incorrectCredentialsMessage;

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

  /// No description provided for @root_bottomNavigationBar_recommendationsLabel.
  ///
  /// In en, this message translates to:
  /// **'For you'**
  String get root_bottomNavigationBar_recommendationsLabel;

  /// No description provided for @root_bottomNavigationBar_searchLabel.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get root_bottomNavigationBar_searchLabel;

  /// No description provided for @root_bottomNavigationBar_myProjectsLabel.
  ///
  /// In en, this message translates to:
  /// **'My projects'**
  String get root_bottomNavigationBar_myProjectsLabel;

  /// No description provided for @root_bottomNavigationBar_applicationsLabel.
  ///
  /// In en, this message translates to:
  /// **'Applications'**
  String get root_bottomNavigationBar_applicationsLabel;

  /// No description provided for @root_bottomNavigationBar_userLabel.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get root_bottomNavigationBar_userLabel;

  /// No description provided for @root_projects_search_input_hint.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get root_projects_search_input_hint;

  /// No description provided for @root_projects_projectCard_contactsTitle.
  ///
  /// In en, this message translates to:
  /// **'Contacts:'**
  String get root_projects_projectCard_contactsTitle;

  /// No description provided for @root_projects_projectCard_nameTitle.
  ///
  /// In en, this message translates to:
  /// **'Name:'**
  String get root_projects_projectCard_nameTitle;

  /// No description provided for @root_projects_projectCard_descriptionTitle.
  ///
  /// In en, this message translates to:
  /// **'Description:'**
  String get root_projects_projectCard_descriptionTitle;

  /// No description provided for @root_projects_projectCard_applyButtonText.
  ///
  /// In en, this message translates to:
  /// **'Apply'**
  String get root_projects_projectCard_applyButtonText;

  /// No description provided for @root_projects_projectCard_recommendationsText.
  ///
  /// In en, this message translates to:
  /// **'Recommendations'**
  String get root_projects_projectCard_recommendationsText;

  /// No description provided for @root_projects_projectCard_datesText.
  ///
  /// In en, this message translates to:
  /// **'Project dates:'**
  String get root_projects_projectCard_datesText;

  /// No description provided for @root_projects_projectCard_applicationDeadlineText.
  ///
  /// In en, this message translates to:
  /// **'Application deadline:'**
  String get root_projects_projectCard_applicationDeadlineText;

  /// No description provided for @root_projects_projectCard_employmentTypeText.
  ///
  /// In en, this message translates to:
  /// **'Employment type:'**
  String get root_projects_projectCard_employmentTypeText;

  /// No description provided for @root_projects_projectCard_territoryText.
  ///
  /// In en, this message translates to:
  /// **'Territory:'**
  String get root_projects_projectCard_territoryText;

  /// No description provided for @root_projects_projectCard_skillsText.
  ///
  /// In en, this message translates to:
  /// **'Required skills:'**
  String get root_projects_projectCard_skillsText;

  /// No description provided for @root_projects_projectCard_creditNumberText.
  ///
  /// In en, this message translates to:
  /// **'Credits number:'**
  String get root_projects_projectCard_creditNumberText;

  /// No description provided for @root_projects_projectCard_campusText.
  ///
  /// In en, this message translates to:
  /// **'Campus:'**
  String get root_projects_projectCard_campusText;

  /// No description provided for @root_projects_projectCard_projectTypeText.
  ///
  /// In en, this message translates to:
  /// **'Project type:'**
  String get root_projects_projectCard_projectTypeText;

  /// No description provided for @root_projects_projectCard_participantsNumberTooltipText.
  ///
  /// In en, this message translates to:
  /// **'Participants number'**
  String get root_projects_projectCard_participantsNumberTooltipText;

  /// No description provided for @root_projects_projectCard_weeklyHoursTooltipText.
  ///
  /// In en, this message translates to:
  /// **'Hours per week'**
  String get root_projects_projectCard_weeklyHoursTooltipText;

  /// No description provided for @root_projects_projectCard_employmentTypeRemote.
  ///
  /// In en, this message translates to:
  /// **'Remote'**
  String get root_projects_projectCard_employmentTypeRemote;

  /// No description provided for @root_projects_projectCard_employmentTypeOnSiteWork.
  ///
  /// In en, this message translates to:
  /// **'On site'**
  String get root_projects_projectCard_employmentTypeOnSiteWork;

  /// No description provided for @root_projects_projectCard_employmentTypeExpeditions.
  ///
  /// In en, this message translates to:
  /// **'Expedition'**
  String get root_projects_projectCard_employmentTypeExpeditions;

  /// No description provided for @root_projects_projectCard_employmentTypeInternships.
  ///
  /// In en, this message translates to:
  /// **'Internship'**
  String get root_projects_projectCard_employmentTypeInternships;

  /// No description provided for @root_projects_projectCard_campusTypeMoscow.
  ///
  /// In en, this message translates to:
  /// **'Moscow'**
  String get root_projects_projectCard_campusTypeMoscow;

  /// No description provided for @root_projects_projectCard_campusTypeNizhniyNovgorod.
  ///
  /// In en, this message translates to:
  /// **'Nizhniy Novgorod'**
  String get root_projects_projectCard_campusTypeNizhniyNovgorod;

  /// No description provided for @root_projects_projectCard_campusTypePerm.
  ///
  /// In en, this message translates to:
  /// **'Perm'**
  String get root_projects_projectCard_campusTypePerm;

  /// No description provided for @root_projects_projectCard_campusTypeSaintPetersburg.
  ///
  /// In en, this message translates to:
  /// **'Saint Petersburg'**
  String get root_projects_projectCard_campusTypeSaintPetersburg;

  /// No description provided for @root_projects_projectCard_projectTypeResearch.
  ///
  /// In en, this message translates to:
  /// **'Research'**
  String get root_projects_projectCard_projectTypeResearch;

  /// No description provided for @root_projects_projectCard_projectTypeApplication.
  ///
  /// In en, this message translates to:
  /// **'Application'**
  String get root_projects_projectCard_projectTypeApplication;

  /// No description provided for @root_projects_projectCard_projectTypeService.
  ///
  /// In en, this message translates to:
  /// **'Service'**
  String get root_projects_projectCard_projectTypeService;

  /// No description provided for @root_applications_sentApplicationsTabTitle.
  ///
  /// In en, this message translates to:
  /// **'Outgoing'**
  String get root_applications_sentApplicationsTabTitle;

  /// No description provided for @root_applications_incomingApplicationsTabTitle.
  ///
  /// In en, this message translates to:
  /// **'Incoming'**
  String get root_applications_incomingApplicationsTabTitle;

  /// No description provided for @root_applications_applicationCard_messageTitle.
  ///
  /// In en, this message translates to:
  /// **'Accompanying message:'**
  String get root_applications_applicationCard_messageTitle;

  /// No description provided for @root_applications_applicationCard_statusTitle.
  ///
  /// In en, this message translates to:
  /// **'Status:'**
  String get root_applications_applicationCard_statusTitle;

  /// No description provided for @root_applications_applicationCard_statusAppliedText.
  ///
  /// In en, this message translates to:
  /// **'awaiting review'**
  String get root_applications_applicationCard_statusAppliedText;

  /// No description provided for @root_applications_applicationCard_statusRejectedText.
  ///
  /// In en, this message translates to:
  /// **'rejected'**
  String get root_applications_applicationCard_statusRejectedText;

  /// No description provided for @root_applications_applicationCard_statusAcceptedText.
  ///
  /// In en, this message translates to:
  /// **'accepted'**
  String get root_applications_applicationCard_statusAcceptedText;

  /// No description provided for @root_applications_applicationCard_processApplicationRejectText.
  ///
  /// In en, this message translates to:
  /// **'Reject'**
  String get root_applications_applicationCard_processApplicationRejectText;

  /// No description provided for @root_applications_applicationCard_processApplicationAcceptText.
  ///
  /// In en, this message translates to:
  /// **'Accept'**
  String get root_applications_applicationCard_processApplicationAcceptText;

  /// No description provided for @root_applyProject_messageInputHint.
  ///
  /// In en, this message translates to:
  /// **'Message...'**
  String get root_applyProject_messageInputHint;

  /// No description provided for @root_applyProject_applyButtonText.
  ///
  /// In en, this message translates to:
  /// **'Apply'**
  String get root_applyProject_applyButtonText;

  /// No description provided for @root_applyProject_alreadyAppliedErrorMessage.
  ///
  /// In en, this message translates to:
  /// **'You have already applied'**
  String get root_applyProject_alreadyAppliedErrorMessage;

  /// No description provided for @root_applyProject_connectionErrorMessage.
  ///
  /// In en, this message translates to:
  /// **'No internet connection'**
  String get root_applyProject_connectionErrorMessage;

  /// No description provided for @root_applyProject_undefinedErrorMessage.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong'**
  String get root_applyProject_undefinedErrorMessage;

  /// No description provided for @root_createProject_createButtonText.
  ///
  /// In en, this message translates to:
  /// **'Create'**
  String get root_createProject_createButtonText;

  /// No description provided for @root_createProject_nameInputHint.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get root_createProject_nameInputHint;

  /// No description provided for @root_createProject_nameTitle.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get root_createProject_nameTitle;

  /// No description provided for @root_createProject_descriptionInputHint.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get root_createProject_descriptionInputHint;

  /// No description provided for @root_createProject_descriptionTitle.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get root_createProject_descriptionTitle;

  /// No description provided for @root_createProject_contactsInputHint.
  ///
  /// In en, this message translates to:
  /// **'Contacts'**
  String get root_createProject_contactsInputHint;

  /// No description provided for @root_createProject_contactsTitle.
  ///
  /// In en, this message translates to:
  /// **'Contacts'**
  String get root_createProject_contactsTitle;

  /// No description provided for @root_createProject_startDateInputHint.
  ///
  /// In en, this message translates to:
  /// **'Not specified'**
  String get root_createProject_startDateInputHint;

  /// No description provided for @root_createProject_startDateTitle.
  ///
  /// In en, this message translates to:
  /// **'Start date'**
  String get root_createProject_startDateTitle;

  /// No description provided for @root_createProject_endDateInputHint.
  ///
  /// In en, this message translates to:
  /// **'Not specified'**
  String get root_createProject_endDateInputHint;

  /// No description provided for @root_createProject_endDateTitle.
  ///
  /// In en, this message translates to:
  /// **'End date'**
  String get root_createProject_endDateTitle;

  /// No description provided for @root_createProject_applicationDeadlineInputHint.
  ///
  /// In en, this message translates to:
  /// **'Not specified'**
  String get root_createProject_applicationDeadlineInputHint;

  /// No description provided for @root_createProject_applicationDeadlineTitle.
  ///
  /// In en, this message translates to:
  /// **'Application deadline'**
  String get root_createProject_applicationDeadlineTitle;

  /// No description provided for @root_createProject_employmentTypeInputHint.
  ///
  /// In en, this message translates to:
  /// **'Not specified'**
  String get root_createProject_employmentTypeInputHint;

  /// No description provided for @root_createProject_employmentTypeTitle.
  ///
  /// In en, this message translates to:
  /// **'Employment type'**
  String get root_createProject_employmentTypeTitle;

  /// No description provided for @root_createProject_territoryInputHint.
  ///
  /// In en, this message translates to:
  /// **'Not specified'**
  String get root_createProject_territoryInputHint;

  /// No description provided for @root_createProject_territoryTitle.
  ///
  /// In en, this message translates to:
  /// **'Territory'**
  String get root_createProject_territoryTitle;

  /// No description provided for @root_createProject_skillsInputHint.
  ///
  /// In en, this message translates to:
  /// **'Not specified'**
  String get root_createProject_skillsInputHint;

  /// No description provided for @root_createProject_skillsTitle.
  ///
  /// In en, this message translates to:
  /// **'Required skills'**
  String get root_createProject_skillsTitle;

  /// No description provided for @root_createProject_creditNumberInputHint.
  ///
  /// In en, this message translates to:
  /// **'Not specified'**
  String get root_createProject_creditNumberInputHint;

  /// No description provided for @root_createProject_creditNumberTitle.
  ///
  /// In en, this message translates to:
  /// **'Credits number'**
  String get root_createProject_creditNumberTitle;

  /// No description provided for @root_createProject_campusInputHint.
  ///
  /// In en, this message translates to:
  /// **'Not specified'**
  String get root_createProject_campusInputHint;

  /// No description provided for @root_createProject_campusTitle.
  ///
  /// In en, this message translates to:
  /// **'Campus'**
  String get root_createProject_campusTitle;

  /// No description provided for @root_createProject_participantsNumberInputHint.
  ///
  /// In en, this message translates to:
  /// **'Not specified'**
  String get root_createProject_participantsNumberInputHint;

  /// No description provided for @root_createProject_participantsNumberTitle.
  ///
  /// In en, this message translates to:
  /// **'Participants number'**
  String get root_createProject_participantsNumberTitle;

  /// No description provided for @root_createProject_projectTypeInputHint.
  ///
  /// In en, this message translates to:
  /// **'Not specified'**
  String get root_createProject_projectTypeInputHint;

  /// No description provided for @root_createProject_projectTypeTitle.
  ///
  /// In en, this message translates to:
  /// **'Project type'**
  String get root_createProject_projectTypeTitle;

  /// No description provided for @root_createProject_weeklyHoursInputHint.
  ///
  /// In en, this message translates to:
  /// **'Not specified'**
  String get root_createProject_weeklyHoursInputHint;

  /// No description provided for @root_createProject_weeklyHoursNumberTitle.
  ///
  /// In en, this message translates to:
  /// **'Hours per week'**
  String get root_createProject_weeklyHoursNumberTitle;

  /// No description provided for @root_createProject_categoriesTitle.
  ///
  /// In en, this message translates to:
  /// **'Categories'**
  String get root_createProject_categoriesTitle;

  /// No description provided for @root_createProject_employmentTypeRemote.
  ///
  /// In en, this message translates to:
  /// **'Remote'**
  String get root_createProject_employmentTypeRemote;

  /// No description provided for @root_createProject_employmentTypeOnSiteWork.
  ///
  /// In en, this message translates to:
  /// **'On site'**
  String get root_createProject_employmentTypeOnSiteWork;

  /// No description provided for @root_createProject_employmentTypeExpeditions.
  ///
  /// In en, this message translates to:
  /// **'Expedition'**
  String get root_createProject_employmentTypeExpeditions;

  /// No description provided for @root_createProject_employmentTypeInternships.
  ///
  /// In en, this message translates to:
  /// **'Internship'**
  String get root_createProject_employmentTypeInternships;

  /// No description provided for @root_createProject_campusTypeMoscow.
  ///
  /// In en, this message translates to:
  /// **'Moscow'**
  String get root_createProject_campusTypeMoscow;

  /// No description provided for @root_createProject_campusTypeNizhniyNovgorod.
  ///
  /// In en, this message translates to:
  /// **'Nizhniy Novgorod'**
  String get root_createProject_campusTypeNizhniyNovgorod;

  /// No description provided for @root_createProject_campusTypePerm.
  ///
  /// In en, this message translates to:
  /// **'Perm'**
  String get root_createProject_campusTypePerm;

  /// No description provided for @root_createProject_campusTypeSaintPetersburg.
  ///
  /// In en, this message translates to:
  /// **'Saint Petersburg'**
  String get root_createProject_campusTypeSaintPetersburg;

  /// No description provided for @root_createProject_projectTypeResearch.
  ///
  /// In en, this message translates to:
  /// **'Research'**
  String get root_createProject_projectTypeResearch;

  /// No description provided for @root_createProject_projectTypeApplication.
  ///
  /// In en, this message translates to:
  /// **'Application'**
  String get root_createProject_projectTypeApplication;

  /// No description provided for @root_createProject_projectTypeService.
  ///
  /// In en, this message translates to:
  /// **'Service'**
  String get root_createProject_projectTypeService;

  /// No description provided for @root_createProject_connectionErrorMessage.
  ///
  /// In en, this message translates to:
  /// **'No internet connection'**
  String get root_createProject_connectionErrorMessage;

  /// No description provided for @root_createProject_undefinedErrorMessage.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong'**
  String get root_createProject_undefinedErrorMessage;

  /// No description provided for @root_profile_connectionErrorMessage.
  ///
  /// In en, this message translates to:
  /// **'No internet connection'**
  String get root_profile_connectionErrorMessage;

  /// No description provided for @root_profile_undefinedErrorMessageTitle.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong'**
  String get root_profile_undefinedErrorMessageTitle;

  /// No description provided for @root_profile_undefinedErrorMessageSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Technical error, we are solving the issue'**
  String get root_profile_undefinedErrorMessageSubtitle;

  /// No description provided for @root_profile_tryAgainButtonText.
  ///
  /// In en, this message translates to:
  /// **'Try again'**
  String get root_profile_tryAgainButtonText;

  /// No description provided for @root_profile_emailTitle.
  ///
  /// In en, this message translates to:
  /// **'E-mail'**
  String get root_profile_emailTitle;

  /// No description provided for @root_profile_fullNameTitle.
  ///
  /// In en, this message translates to:
  /// **'Full name'**
  String get root_profile_fullNameTitle;

  /// No description provided for @root_profile_facultyTitle.
  ///
  /// In en, this message translates to:
  /// **'Faculty'**
  String get root_profile_facultyTitle;

  /// No description provided for @root_profile_facultyNotSetText.
  ///
  /// In en, this message translates to:
  /// **'Not specified'**
  String get root_profile_facultyNotSetText;

  /// No description provided for @root_profile_bioTitle.
  ///
  /// In en, this message translates to:
  /// **'About me'**
  String get root_profile_bioTitle;

  /// No description provided for @root_profile_bioNotSetText.
  ///
  /// In en, this message translates to:
  /// **'Not specified'**
  String get root_profile_bioNotSetText;

  /// No description provided for @root_profile_categoriesTitle.
  ///
  /// In en, this message translates to:
  /// **'Skills'**
  String get root_profile_categoriesTitle;

  /// No description provided for @root_profile_categoriesNotSetText.
  ///
  /// In en, this message translates to:
  /// **'Not specified'**
  String get root_profile_categoriesNotSetText;

  /// No description provided for @root_profile_logoutButtonText.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get root_profile_logoutButtonText;

  /// No description provided for @profileEditing_profileEditing_connectionErrorMessage.
  ///
  /// In en, this message translates to:
  /// **'No internet connection'**
  String get profileEditing_profileEditing_connectionErrorMessage;

  /// No description provided for @profileEditing_profileEditing_undefinedErrorMessageTitle.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong'**
  String get profileEditing_profileEditing_undefinedErrorMessageTitle;

  /// No description provided for @profileEditing_profileEditing_undefinedErrorMessageSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Technical error, we are solving the issue'**
  String get profileEditing_profileEditing_undefinedErrorMessageSubtitle;

  /// No description provided for @profileEditing_profileEditing_tryAgainButtonText.
  ///
  /// In en, this message translates to:
  /// **'Try again'**
  String get profileEditing_profileEditing_tryAgainButtonText;

  /// No description provided for @profileEditing_profileEditing_emailTitle.
  ///
  /// In en, this message translates to:
  /// **'E-mail'**
  String get profileEditing_profileEditing_emailTitle;

  /// No description provided for @profileEditing_profileEditing_emailInputHint.
  ///
  /// In en, this message translates to:
  /// **'E-mail'**
  String get profileEditing_profileEditing_emailInputHint;

  /// No description provided for @profileEditing_profileEditing_fullNameTitle.
  ///
  /// In en, this message translates to:
  /// **'Full name'**
  String get profileEditing_profileEditing_fullNameTitle;

  /// No description provided for @profileEditing_profileEditing_fullNameInputHint.
  ///
  /// In en, this message translates to:
  /// **'Full name'**
  String get profileEditing_profileEditing_fullNameInputHint;

  /// No description provided for @profileEditing_profileEditing_facultyTitle.
  ///
  /// In en, this message translates to:
  /// **'Faculty'**
  String get profileEditing_profileEditing_facultyTitle;

  /// No description provided for @profileEditing_profileEditing_facultyNotSetText.
  ///
  /// In en, this message translates to:
  /// **'Not specified'**
  String get profileEditing_profileEditing_facultyNotSetText;

  /// No description provided for @profileEditing_profileEditing_bioTitle.
  ///
  /// In en, this message translates to:
  /// **'About me'**
  String get profileEditing_profileEditing_bioTitle;

  /// No description provided for @profileEditing_profileEditing_bioNotSetText.
  ///
  /// In en, this message translates to:
  /// **'Not specified'**
  String get profileEditing_profileEditing_bioNotSetText;

  /// No description provided for @profileEditing_profileEditing_categoriesTitle.
  ///
  /// In en, this message translates to:
  /// **'Skills'**
  String get profileEditing_profileEditing_categoriesTitle;

  /// No description provided for @profileEditing_profileEditing_submitButtonText.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get profileEditing_profileEditing_submitButtonText;

  /// No description provided for @categories_categories_categoriesInputHint.
  ///
  /// In en, this message translates to:
  /// **'Start typing...'**
  String get categories_categories_categoriesInputHint;

  /// No description provided for @common_lists_loading_noItemsMessage.
  ///
  /// In en, this message translates to:
  /// **'Nothing found'**
  String get common_lists_loading_noItemsMessage;

  /// No description provided for @common_lists_loading_connectionErrorMessage.
  ///
  /// In en, this message translates to:
  /// **'No internet connection'**
  String get common_lists_loading_connectionErrorMessage;

  /// No description provided for @common_lists_loading_undefinedErrorMessageTitle.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong'**
  String get common_lists_loading_undefinedErrorMessageTitle;

  /// No description provided for @common_lists_loading_undefinedErrorMessageSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Technical error, we are solving the issue'**
  String get common_lists_loading_undefinedErrorMessageSubtitle;

  /// No description provided for @common_lists_loading_tryAgainButtonText.
  ///
  /// In en, this message translates to:
  /// **'Try again'**
  String get common_lists_loading_tryAgainButtonText;
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
