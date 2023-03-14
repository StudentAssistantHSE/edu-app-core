import 'package:intl/intl.dart' as intl;

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
  String get login_login_passwordRecoveryButtonText => 'Forgot password?';

  @override
  String get login_login_incorrectCredentialsMessage => 'Incorrect credentials';

  @override
  String get login_login_accountDisabledMessage => 'Your account was disabled. Please contact out support team';

  @override
  String get login_login_noPrivilegesMessage => 'You don\'t have the necessary permissions';

  @override
  String get login_login_connectionErrorMessage => 'Connection error';

  @override
  String get login_login_undefinedErrorMessage => 'Something went wrong';

  @override
  String get login_emailCode_pageTitle => 'Signing in';

  @override
  String get login_emailCode_pageSubtitle => 'Enter the code that we have sent to your e-mail';

  @override
  String login_emailCode_attemptsLeftMessage(int current, int max) {
    String _temp0 = intl.Intl.pluralLogic(
      current,
      locale: localeName,
      other: '$current/$max attempts left',
      many: '$current/$max attempts left',
      few: '$current/$max attempts left',
      one: '1 attempt left',
    );
    return '$_temp0';
  }

  @override
  String get login_emailCode_invalidCodeMessage => 'Invalid code';

  @override
  String get login_emailCode_noCodeMessage => 'Attempts ended. Request a new code';

  @override
  String get login_emailCode_goToEmailButtonText => 'Go to e-mail app';

  @override
  String get login_emailCode_pasteCodeDialogTitle => 'Insert code';

  @override
  String get login_emailCode_pasteCodeDialogContent => 'Insert code';

  @override
  String get login_emailCode_pasteCodeDialogAffirmativeActionText => 'Yes';

  @override
  String get login_emailCode_pasteCodeDialogNegativeActionText => 'No';

  @override
  String get login_emailCode_chooseEmailAppToGoDialogTitle => 'Choose app';

  @override
  String get login_emailCode_resendCodeButtonText => 'Send again';

  @override
  String get login_emailCode_failedToResendCodeMessage => 'Failed to send code';

  @override
  String get login_emailCode_successfullyResentCodeMessage => 'Code was successfully sent';

  @override
  String get login_emailCode_connectionErrorMessage => 'Connection error';

  @override
  String get login_emailCode_undefinedErrorMessage => 'Something went wrong';

  @override
  String get registration_registration_pageTitle => 'Sign up';

  @override
  String get registration_registration_emailInputHint => 'E-mail';

  @override
  String get registration_registration_usernameInputHint => 'Username';

  @override
  String get registration_registration_emailAlreadyUsedMessage => 'Unavailable E-mail';

  @override
  String get registration_registration_usernameAlreadyUsedMessage => 'Unavailable username';

  @override
  String get registration_registration_birthdayYearInputHint => 'Birthday year';

  @override
  String get registration_registration_genderInputHint => 'Gender';

  @override
  String get registration_registration_passwordInputHint => 'Password';

  @override
  String get registration_registration_repeatPasswordInputHint => 'Repeat password';

  @override
  String get registration_registration_usernameAllowedSymbolsDialogTitle => 'Username';

  @override
  String registration_registration_usernameRequiredFromToSymbols(int from, int to) {
    return 'From $from to $to symbols';
  }

  @override
  String get registration_registration_usernameAllowedSymbolsDialogLowercaseLatinLettersItem => 'Lowercase latin letters a-z';

  @override
  String get registration_registration_usernameAllowedSymbolsDialogDigitsItem => 'Digits';

  @override
  String get registration_registration_usernameAllowedSymbolsDialogSpecialSymbolsItem => 'Symbols \".\", \"_\"';

  @override
  String get registration_registration_usernameAllowedSymbolsDialogActionText => 'OK';

  @override
  String get registration_registration_nextStepButtonText => 'Next';

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
  String get registration_registration_filledIncorrectMessage => 'Fields are filled in incorrectly';

  @override
  String get registration_registration_connectionErrorMessage => 'Connection error';

  @override
  String get registration_registration_undefinedErrorMessage => 'Something went wrong';

  @override
  String get registration_emailCode_pageTitle => 'Just a little bit left';

  @override
  String get registration_emailCode_pageSubtitle => 'Enter the code that we have sent to your e-mail';

  @override
  String registration_emailCode_attemptsLeftMessage(int current, int max) {
    String _temp0 = intl.Intl.pluralLogic(
      current,
      locale: localeName,
      other: '$current/$max attempts left',
      many: '$current/$max attempts left',
      few: '$current/$max attempts left',
      one: '1 attempt left',
    );
    return '$_temp0';
  }

  @override
  String get registration_emailCode_invalidCodeMessage => 'Invalid code';

  @override
  String get registration_emailCode_noCodeMessage => 'Attempts ended. Request a new code';

  @override
  String get registration_emailCode_goToEmailButtonText => 'Go to e-mail app';

  @override
  String get registration_emailCode_pasteCodeDialogTitle => 'Insert code';

  @override
  String get registration_emailCode_pasteCodeDialogContent => 'Insert code';

  @override
  String get registration_emailCode_pasteCodeDialogAffirmativeActionText => 'Yes';

  @override
  String get registration_emailCode_pasteCodeDialogNegativeActionText => 'No';

  @override
  String get registration_emailCode_chooseEmailAppToGoDialogTitle => 'Choose app';

  @override
  String get registration_emailCode_resendCodeButtonText => 'Send again';

  @override
  String get registration_emailCode_failedToResendCodeMessage => 'Failed to send code';

  @override
  String get registration_emailCode_successfullyResentCodeMessage => 'Code was successfully sent';

  @override
  String get registration_emailCode_connectionErrorMessage => 'Connection error';

  @override
  String get registration_emailCode_undefinedErrorMessage => 'Something went wrong';

  @override
  String get registration_finishRegistration_pageTitle => 'Congratulations!';

  @override
  String get registration_finishRegistration_pageSubtitle => 'You have successfully signed up';

  @override
  String get registration_finishRegistration_startButtonText => 'Let\'s start';

  @override
  String get passwordRecovery_passwordRecovery_pageTitle => 'Password recovery';

  @override
  String get passwordRecovery_passwordRecovery_emailOrUsernameInputHint => 'E-mail / username';

  @override
  String get passwordRecovery_passwordRecovery_passwordInputHint => 'New password';

  @override
  String get passwordRecovery_passwordRecovery_repeatPasswordInputHint => 'Repeat password';

  @override
  String get passwordRecovery_passwordRecovery_submitRecoverButtonText => 'Recover';

  @override
  String get passwordRecovery_passwordRecovery_passwordRequiredSymbolsDialogTitle => 'Password';

  @override
  String passwordRecovery_passwordRecovery_passwordRequiredFromToSymbols(int from, int to) {
    return 'From $from to $to symbols';
  }

  @override
  String get passwordRecovery_passwordRecovery_passwordRequiredSymbolsDialogLowercaseLatinLettersItem => 'At least one lowercase latin letter a-z';

  @override
  String get passwordRecovery_passwordRecovery_passwordRequiredSymbolsDialogUppercaseLatinLettersItem => 'At least one lowercase Latin letter A-Z';

  @override
  String get passwordRecovery_passwordRecovery_passwordRequiredSymbolsDialogDigitsItem => 'At least one digit';

  @override
  String get passwordRecovery_passwordRecovery_passwordRequiredSymbolsDialogActionText => 'OK';

  @override
  String get passwordRecovery_passwordRecovery_noRepeatedPasswordMatchMessage => 'Passwords don\'t match';

  @override
  String get passwordRecovery_passwordRecovery_connectionErrorMessage => 'Connection error';

  @override
  String get passwordRecovery_passwordRecovery_undefinedErrorMessage => 'Something went wrong';

  @override
  String get passwordRecovery_emailCode_pageTitle => 'Password recovery';

  @override
  String get passwordRecovery_emailCode_pageSubtitle => 'Enter the code that we have sent to your e-mail';

  @override
  String passwordRecovery_emailCode_attemptsLeftMessage(int current, int max) {
    String _temp0 = intl.Intl.pluralLogic(
      current,
      locale: localeName,
      other: '$current/$max attempts left',
      many: '$current/$max attempts left',
      few: '$current/$max attempts left',
      one: '1 attempt left',
    );
    return '$_temp0';
  }

  @override
  String get passwordRecovery_emailCode_invalidCodeMessage => 'Invalid code';

  @override
  String get passwordRecovery_emailCode_noCodeMessage => 'Attempts ended. Request a new code';

  @override
  String get passwordRecovery_emailCode_goToEmailButtonText => 'Go to e-mail app';

  @override
  String get passwordRecovery_emailCode_pasteCodeDialogTitle => 'Insert code';

  @override
  String get passwordRecovery_emailCode_pasteCodeDialogContent => 'Insert code';

  @override
  String get passwordRecovery_emailCode_pasteCodeDialogAffirmativeActionText => 'Yes';

  @override
  String get passwordRecovery_emailCode_pasteCodeDialogNegativeActionText => 'No';

  @override
  String get passwordRecovery_emailCode_chooseEmailAppToGoDialogTitle => 'Choose app';

  @override
  String get passwordRecovery_emailCode_resendCodeButtonText => 'Send again';

  @override
  String get passwordRecovery_emailCode_failedToResendCodeMessage => 'Failed to send code';

  @override
  String get passwordRecovery_emailCode_successfullyResentCodeMessage => 'Code was successfully sent';

  @override
  String get passwordRecovery_emailCode_connectionErrorMessage => 'Connection error';

  @override
  String get passwordRecovery_emailCode_undefinedErrorMessage => 'Something went wrong';

  @override
  String get root_bottomNavigationBar_feedLabel => 'Feed';

  @override
  String get root_bottomNavigationBar_searchLabel => 'Search';

  @override
  String get root_bottomNavigationBar_homeLabel => 'Home';

  @override
  String get root_bottomNavigationBar_catalogLabel => 'Catalog';

  @override
  String get root_bottomNavigationBar_userLabel => 'Profile';

  @override
  String root_home_curtainHeaderTemperatureCelsiusText(String temperature) {
    return '$temperature °C';
  }

  @override
  String root_home_curtainHeaderTemperatureFahrenheitText(String temperature) {
    return '$temperature °F';
  }

  @override
  String root_home_curtainHeaderDateJanuary(int day) {
    return 'January $day';
  }

  @override
  String root_home_curtainHeaderDateFebruary(int day) {
    return 'February $day';
  }

  @override
  String root_home_curtainHeaderDateMarch(int day) {
    return 'March $day';
  }

  @override
  String root_home_curtainHeaderDateApril(int day) {
    return 'April $day';
  }

  @override
  String root_home_curtainHeaderDateMay(int day) {
    return 'May $day';
  }

  @override
  String root_home_curtainHeaderDateJune(int day) {
    return 'June $day';
  }

  @override
  String root_home_curtainHeaderDateJuly(int day) {
    return 'July $day';
  }

  @override
  String root_home_curtainHeaderDateAugust(int day) {
    return 'August $day';
  }

  @override
  String root_home_curtainHeaderDateSeptember(int day) {
    return 'September $day';
  }

  @override
  String root_home_curtainHeaderDateOctober(int day) {
    return 'October $day';
  }

  @override
  String root_home_curtainHeaderDateNovember(int day) {
    return 'November $day';
  }

  @override
  String root_home_curtainHeaderDateDecember(int day) {
    return 'December $day';
  }

  @override
  String get root_home_curtainContentTitle => 'Today';

  @override
  String root_home_curtainContentTemperatureCelsiusText(String temperature) {
    return '$temperature°C';
  }

  @override
  String root_home_curtainContentTemperatureFahrenheitText(String temperature) {
    return '$temperature°F';
  }

  @override
  String root_home_curtainContentFeelsLikeTemperatureCelsiusText(String temperature) {
    return 'Feels like $temperature°C';
  }

  @override
  String root_home_curtainContentFeelsLikeTemperatureFahrenheitText(String temperature) {
    return 'Feels like $temperature°F';
  }

  @override
  String get root_home_curtainContentPrecipitationsTitle => 'Precipitations';

  @override
  String root_home_curtainContentPrecipitationsValueMetricText(int precipitations) {
    return '$precipitations mm';
  }

  @override
  String root_home_curtainContentPrecipitationsValueImperialText(Object precipitations) {
    return '$precipitations in';
  }

  @override
  String get root_home_curtainContentHumidityTitle => 'Humidity';

  @override
  String root_home_curtainContentHumidityValueText(int humidity) {
    return '$humidity%';
  }

  @override
  String get root_home_curtainContentWindSpeedTitle => 'Wind';

  @override
  String root_home_curtainContentWindSpeedValueMetricText(int windSpeed) {
    return '$windSpeed m/s';
  }

  @override
  String root_home_curtainContentWindSpeedValueImperialText(int windSpeed) {
    return '$windSpeed m/h';
  }

  @override
  String get root_home_curtainContentPressureTitle => 'Pressure';

  @override
  String root_home_curtainContentPressureValueMetricText(int pressure) {
    return '$pressure mm Hg';
  }

  @override
  String root_home_curtainContentPressureValueImperialText(Object pressure) {
    return '$pressure in Hg';
  }

  @override
  String root_home_curtainContentWeatherForecastTitle(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Weather for $days days',
      many: 'Weather for $days days',
      few: 'Weather for $days days',
      one: 'Weather for 1 day',
    );
    return '$_temp0';
  }

  @override
  String get root_home_curtainContentWeatherForecastItemDaysOfWeekAbbreviationsMonday => 'Mo';

  @override
  String get root_home_curtainContentWeatherForecastItemDaysOfWeekAbbreviationsTuesday => 'Tu';

  @override
  String get root_home_curtainContentWeatherForecastItemDaysOfWeekAbbreviationsWednesday => 'We';

  @override
  String get root_home_curtainContentWeatherForecastItemDaysOfWeekAbbreviationsThursday => 'Th';

  @override
  String get root_home_curtainContentWeatherForecastItemDaysOfWeekAbbreviationsFriday => 'Fr';

  @override
  String get root_home_curtainContentWeatherForecastItemDaysOfWeekAbbreviationsSaturday => 'Sa';

  @override
  String get root_home_curtainContentWeatherForecastItemDaysOfWeekAbbreviationsSunday => 'Su';

  @override
  String root_home_curtainContentWeatherForecastItemTemperatureCelsiusText(String temperature) {
    return '$temperature°C';
  }

  @override
  String root_home_curtainContentWeatherForecastItemTemperatureFahrenheitText(String temperature) {
    return '$temperature°F';
  }

  @override
  String root_home_curtainContentWeatherForecastItemFeelsLikeTemperatureCelsiusText(String temperature) {
    return '$temperature°C';
  }

  @override
  String root_home_curtainContentWeatherForecastItemFeelsLikeTemperatureFahrenheitText(String temperature) {
    return '$temperature°F';
  }

  @override
  String get root_home_weatherLoadingConnectionErrorMessage => 'No internet connection';

  @override
  String get root_home_weatherLoadingUndefinedErrorMessageTitle => 'Something went wrong';

  @override
  String get root_home_weatherLoadingUndefinedErrorMessageSubtitle => 'Technical error, we are solving the issue';

  @override
  String get root_home_weatherLoadingTryAgainButtonText => 'Try again';

  @override
  String get root_home_choicesLoadingConnectionErrorMessage => 'No internet connection';

  @override
  String get root_home_choicesLoadingUndefinedErrorMessageTitle => 'Something went wrong';

  @override
  String get root_home_choicesLoadingUndefinedErrorMessageSubtitle => 'Technical error, we are solving the issue';

  @override
  String get root_home_choicesLoadingTryAgainButtonText => 'Try again';

  @override
  String root_user_looksCountText(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Looks',
      one: 'Look',
    );
    return '$_temp0';
  }

  @override
  String root_user_followersCountText(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Followers',
      one: 'Follower',
    );
    return '$_temp0';
  }

  @override
  String root_user_followsCountText(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Follows',
      one: 'Follow',
    );
    return '$_temp0';
  }

  @override
  String get root_followers_search_input_hint => 'Search';

  @override
  String get root_follows_search_input_hint => 'Search';

  @override
  String get common_lists_loadingConnectionErrorMessage => 'No internet connection';

  @override
  String get common_lists_loadingUndefinedErrorMessageTitle => 'Something went wrong';

  @override
  String get common_lists_loadingUndefinedErrorMessageSubtitle => 'Technical error, we are solving the issue';

  @override
  String get common_lists_loadingTryAgainButtonText => 'Try again';
}
