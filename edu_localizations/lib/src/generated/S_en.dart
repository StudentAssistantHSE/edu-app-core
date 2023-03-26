import 'S.dart';

/// The translations for English (`en`).
class SEn extends S {
  SEn([String locale = 'en']) : super(locale);

  @override
  String get login_login_emailOrUsernameInputHint => 'E-mail / username';

  @override
  String get login_login_passwordInputHint => 'Password';

  @override
  String get login_login_submitLoginButtonText => 'Sign in';

  @override
  String get login_login_pageTitle => 'Signing in';

  @override
  String get login_login_registrationButtonText => 'Sign up';

  @override
  String get login_login_incorrectCredentialsMessage => 'Incorrect credentials';

  @override
  String get login_login_connectionErrorMessage => 'Connection error';

  @override
  String get login_login_undefinedErrorMessage => 'Something went wrong';

  @override
  String get registration_registration_pageTitle => 'Sign up';

  @override
  String get registration_registration_emailInputHint => 'E-mail';

  @override
  String get registration_registration_usernameInputHint => 'Username';

  @override
  String get registration_registration_passwordInputHint => 'Password';

  @override
  String get registration_registration_repeatPasswordInputHint => 'Repeat password';

  @override
  String get registration_registration_passwordRequiredSymbolsDialogTitle => 'Password';

  @override
  String registration_registration_passwordRequiredFromToSymbols(int from, int to) {
    return 'From $from to $to symbols';
  }

  @override
  String get registration_registration_passwordRequiredSymbolsDialogLowercaseLatinLettersItem => 'At least one lowercase latin letter a-z';

  @override
  String get registration_registration_passwordRequiredSymbolsDialogUppercaseLatinLettersItem => 'At least one lowercase Latin letter A-Z';

  @override
  String get registration_registration_passwordRequiredSymbolsDialogDigitsItem => 'At least one digit';

  @override
  String get registration_registration_passwordRequiredSymbolsDialogActionText => 'OK';

  @override
  String get registration_registration_submitRegistrationButtonText => 'Sign up';

  @override
  String get registration_registration_noRepeatedPasswordMatchMessage => 'Passwords don\'t match';

  @override
  String get registration_registration_connectionErrorMessage => 'Connection error';

  @override
  String get registration_registration_undefinedErrorMessage => 'Something went wrong';

  @override
  String get registration_finishRegistration_pageTitle => 'Congratulations!';

  @override
  String get registration_finishRegistration_pageSubtitle => 'You have successfully signed up';

  @override
  String get registration_finishRegistration_startButtonText => 'Let\'s start';

  @override
  String get root_bottomNavigationBar_recommendationsLabel => 'For you';

  @override
  String get root_bottomNavigationBar_searchLabel => 'Search';

  @override
  String get root_bottomNavigationBar_myProjectsLabel => 'My projects';

  @override
  String get root_bottomNavigationBar_applicationsLabel => 'Applications';

  @override
  String get root_bottomNavigationBar_userLabel => 'Profile';

  @override
  String get root_projects_search_input_hint => 'Search';

  @override
  String get root_projects_projectCard_contactsTitle => 'Contacts:';

  @override
  String get root_projects_projectCard_nameTitle => 'Name:';

  @override
  String get root_projects_projectCard_descriptionTitle => 'Description:';

  @override
  String get root_projects_projectCard_applyButtonText => 'Apply';

  @override
  String get root_projects_projectCard_recommendationsText => 'Recommendations';

  @override
  String get root_applications_sentApplicationsTabTitle => 'Outgoing';

  @override
  String get root_applications_incomingApplicationsTabTitle => 'Incoming';

  @override
  String get root_applications_applicationCard_messageTitle => 'Accompanying message:';

  @override
  String get root_applications_applicationCard_statusTitle => 'Status:';

  @override
  String get root_applications_applicationCard_statusAppliedText => 'awaiting review';

  @override
  String get root_applications_applicationCard_statusRejectedText => 'rejected';

  @override
  String get root_applications_applicationCard_statusAcceptedText => 'accepted';

  @override
  String get root_applications_applicationCard_processApplicationRejectText => 'Reject';

  @override
  String get root_applications_applicationCard_processApplicationAcceptText => 'Accept';

  @override
  String get root_applyProject_messageInputHint => 'Message...';

  @override
  String get root_applyProject_applyButtonText => 'Apply';

  @override
  String get root_applyProject_alreadyAppliedErrorMessage => 'You have already applied';

  @override
  String get root_applyProject_connectionErrorMessage => 'No internet connection';

  @override
  String get root_applyProject_undefinedErrorMessage => 'Something went wrong';

  @override
  String get root_createProject_createButtonText => 'Create';

  @override
  String get root_createProject_nameInputHint => 'Name';

  @override
  String get root_createProject_descriptionInputHint => 'Description';

  @override
  String get root_createProject_contactsInputHint => 'Contacts';

  @override
  String get root_createProject_categoriesText => 'Categories';

  @override
  String get root_createProject_categoriesInputHint => 'Start typing...';

  @override
  String get root_createProject_connectionErrorMessage => 'No internet connection';

  @override
  String get root_createProject_undefinedErrorMessage => 'Something went wrong';

  @override
  String get root_profile_connectionErrorMessage => 'No internet connection';

  @override
  String get root_profile_undefinedErrorMessageTitle => 'Something went wrong';

  @override
  String get root_profile_undefinedErrorMessageSubtitle => 'Technical error, we are solving the issue';

  @override
  String get root_profile_tryAgainButtonText => 'Try again';

  @override
  String get root_profile_emailTitle => 'E-mail';

  @override
  String get root_profile_fullNameTitle => 'Full name';

  @override
  String get root_profile_facultyTitle => 'Faculty';

  @override
  String get root_profile_facultyNotSetText => 'Not specified';

  @override
  String get root_profile_bioTitle => 'About me';

  @override
  String get root_profile_bioNotSetText => 'Not specified';

  @override
  String get root_profile_categoriesTitle => 'Skills';

  @override
  String get root_profile_categoriesNotSetText => 'Not specified';

  @override
  String get root_profile_logoutButtonText => 'Logout';

  @override
  String get root_profileEditing_connectionErrorMessage => 'No internet connection';

  @override
  String get root_profileEditing_undefinedErrorMessageTitle => 'Something went wrong';

  @override
  String get root_profileEditing_undefinedErrorMessageSubtitle => 'Technical error, we are solving the issue';

  @override
  String get root_profileEditing_tryAgainButtonText => 'Try again';

  @override
  String get root_profileEditing_emailTitle => 'E-mail';

  @override
  String get root_profileEditing_emailInputHint => 'E-mail';

  @override
  String get root_profileEditing_fullNameTitle => 'Full name';

  @override
  String get root_profileEditing_fullNameInputHint => 'Full name';

  @override
  String get root_profileEditing_facultyTitle => 'Faculty';

  @override
  String get root_profileEditing_facultyNotSetText => 'Not specified';

  @override
  String get root_profileEditing_bioTitle => 'About me';

  @override
  String get root_profileEditing_bioNotSetText => 'Not specified';

  @override
  String get root_profileEditing_categoriesTitle => 'Skills';

  @override
  String get root_profileEditing_categoriesInputHint => 'Start typing...';

  @override
  String get root_profileEditing_submitButtonText => 'Save';

  @override
  String get common_lists_loading_noItemsMessage => 'Nothing found';

  @override
  String get common_lists_loading_connectionErrorMessage => 'No internet connection';

  @override
  String get common_lists_loading_undefinedErrorMessageTitle => 'Something went wrong';

  @override
  String get common_lists_loading_undefinedErrorMessageSubtitle => 'Technical error, we are solving the issue';

  @override
  String get common_lists_loading_tryAgainButtonText => 'Try again';
}
