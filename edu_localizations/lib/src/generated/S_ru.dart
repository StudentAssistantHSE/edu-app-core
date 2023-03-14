import 'package:intl/intl.dart' as intl;

import 'S.dart';

/// The translations for Russian (`ru`).
class SRu extends S {
  SRu([String locale = 'ru']) : super(locale);

  @override
  String get login_login_emailOrUsernameInputHint => 'E-mail / имя пользователя';

  @override
  String get login_login_passwordInputHint => 'Пароль';

  @override
  String get login_login_submitLoginButtonText => 'Войти';

  @override
  String get login_login_pageTitle => 'Вход';

  @override
  String get login_login_registrationButtonText => 'Зарегистрироваться';

  @override
  String get login_login_passwordRecoveryButtonText => 'Забыли пароль?';

  @override
  String get login_login_incorrectCredentialsMessage => 'Неверные учетные данные';

  @override
  String get login_login_accountDisabledMessage => 'Ваш аккаунт был отключен. Пожалуйста, свяжитесь с нашей командой поддержки';

  @override
  String get login_login_noPrivilegesMessage => 'У вас отсутствуют требуемые права';

  @override
  String get login_login_connectionErrorMessage => 'Ошибка подключения';

  @override
  String get login_login_undefinedErrorMessage => 'Что-то пошло не так';

  @override
  String get login_emailCode_pageTitle => 'Вход';

  @override
  String get login_emailCode_pageSubtitle => 'Введите код, который мы отправили вам на e-mail';

  @override
  String login_emailCode_attemptsLeftMessage(int current, int max) {
    String _temp0 = intl.Intl.pluralLogic(
      current,
      locale: localeName,
      other: 'Осталось $current/$max попытки',
      many: 'Осталось $current/$max попыток',
      few: 'Осталось $current/$max попытки',
      one: 'Осталась 1 попытка',
    );
    return '$_temp0';
  }

  @override
  String get login_emailCode_invalidCodeMessage => 'Неверный код';

  @override
  String get login_emailCode_noCodeMessage => 'Попытки закончились, запросите новый код';

  @override
  String get login_emailCode_goToEmailButtonText => 'Перейти в почту';

  @override
  String get login_emailCode_pasteCodeDialogTitle => 'Вставить код';

  @override
  String get login_emailCode_pasteCodeDialogContent => 'Вставить код';

  @override
  String get login_emailCode_pasteCodeDialogAffirmativeActionText => 'Да';

  @override
  String get login_emailCode_pasteCodeDialogNegativeActionText => 'Нет';

  @override
  String get login_emailCode_chooseEmailAppToGoDialogTitle => 'Выберите приложение';

  @override
  String get login_emailCode_resendCodeButtonText => 'Отправить повторно';

  @override
  String get login_emailCode_failedToResendCodeMessage => 'Не удалось отправить код';

  @override
  String get login_emailCode_successfullyResentCodeMessage => 'Код успешно отправлен';

  @override
  String get login_emailCode_connectionErrorMessage => 'Ошибка подключения';

  @override
  String get login_emailCode_undefinedErrorMessage => 'Что-то пошло не так';

  @override
  String get registration_registration_pageTitle => 'Регистрация';

  @override
  String get registration_registration_emailInputHint => 'E-mail';

  @override
  String get registration_registration_usernameInputHint => 'Имя пользователя';

  @override
  String get registration_registration_emailAlreadyUsedMessage => 'Недоступный E-mail';

  @override
  String get registration_registration_usernameAlreadyUsedMessage => 'Недоступное имя пользователя';

  @override
  String get registration_registration_birthdayYearInputHint => 'Год рождения';

  @override
  String get registration_registration_genderInputHint => 'Пол';

  @override
  String get registration_registration_passwordInputHint => 'Пароль';

  @override
  String get registration_registration_repeatPasswordInputHint => 'Повторите пароль';

  @override
  String get registration_registration_usernameAllowedSymbolsDialogTitle => 'Имя пользователя';

  @override
  String registration_registration_usernameRequiredFromToSymbols(int from, int to) {
    return 'От $from до $to символов';
  }

  @override
  String get registration_registration_usernameAllowedSymbolsDialogLowercaseLatinLettersItem => 'Строчные латинские буквы a-z';

  @override
  String get registration_registration_usernameAllowedSymbolsDialogDigitsItem => 'Цифры';

  @override
  String get registration_registration_usernameAllowedSymbolsDialogSpecialSymbolsItem => 'Символы \".\", \"_\"';

  @override
  String get registration_registration_usernameAllowedSymbolsDialogActionText => 'ОК';

  @override
  String get registration_registration_nextStepButtonText => 'Далее';

  @override
  String get registration_registration_passwordRequiredSymbolsDialogTitle => 'Пароль';

  @override
  String registration_registration_passwordRequiredFromToSymbols(int from, int to) {
    return 'От $from до $to символов';
  }

  @override
  String get registration_registration_passwordRequiredSymbolsDialogLowercaseLatinLettersItem => 'Минимум одна строчная латинская буква a-z';

  @override
  String get registration_registration_passwordRequiredSymbolsDialogUppercaseLatinLettersItem => 'Минимум одна заглавная латинская буква A-Z';

  @override
  String get registration_registration_passwordRequiredSymbolsDialogDigitsItem => 'Минимум одна цифра';

  @override
  String get registration_registration_passwordRequiredSymbolsDialogActionText => 'OK';

  @override
  String get registration_registration_submitRegistrationButtonText => 'Зарегестрироваться';

  @override
  String get registration_registration_noRepeatedPasswordMatchMessage => 'Пароли не совпадают';

  @override
  String get registration_registration_filledIncorrectMessage => 'Поля заполнены неверно';

  @override
  String get registration_registration_connectionErrorMessage => 'Ошибка подключения';

  @override
  String get registration_registration_undefinedErrorMessage => 'Что-то пошло не так';

  @override
  String get registration_emailCode_pageTitle => 'Осталось совсем чуть-чуть';

  @override
  String get registration_emailCode_pageSubtitle => 'Введите код, который мы отправили вам на e-mail';

  @override
  String registration_emailCode_attemptsLeftMessage(int current, int max) {
    String _temp0 = intl.Intl.pluralLogic(
      current,
      locale: localeName,
      other: 'Осталось $current/$max попытки',
      many: 'Осталось $current/$max попыток',
      few: 'Осталось $current/$max попытки',
      one: 'Осталась 1 попытка',
    );
    return '$_temp0';
  }

  @override
  String get registration_emailCode_invalidCodeMessage => 'Неверный код';

  @override
  String get registration_emailCode_noCodeMessage => 'Попытки закончились, запросите новый код';

  @override
  String get registration_emailCode_goToEmailButtonText => 'Перейти в почту';

  @override
  String get registration_emailCode_pasteCodeDialogTitle => 'Вставить код';

  @override
  String get registration_emailCode_pasteCodeDialogContent => 'Вставить код';

  @override
  String get registration_emailCode_pasteCodeDialogAffirmativeActionText => 'Да';

  @override
  String get registration_emailCode_pasteCodeDialogNegativeActionText => 'Нет';

  @override
  String get registration_emailCode_chooseEmailAppToGoDialogTitle => 'Выберите приложение';

  @override
  String get registration_emailCode_resendCodeButtonText => 'Отправить повторно';

  @override
  String get registration_emailCode_failedToResendCodeMessage => 'Не удалось отправить код';

  @override
  String get registration_emailCode_successfullyResentCodeMessage => 'Код успешно отправлен';

  @override
  String get registration_emailCode_connectionErrorMessage => 'Ошибка подключения';

  @override
  String get registration_emailCode_undefinedErrorMessage => 'Что-то пошло не так';

  @override
  String get registration_finishRegistration_pageTitle => 'Поздравляем!';

  @override
  String get registration_finishRegistration_pageSubtitle => 'Вы успешно прошли регистрацию';

  @override
  String get registration_finishRegistration_startButtonText => 'Начинаем';

  @override
  String get passwordRecovery_passwordRecovery_pageTitle => 'Восстановление пароля';

  @override
  String get passwordRecovery_passwordRecovery_emailOrUsernameInputHint => 'E-mail / имя пользователя';

  @override
  String get passwordRecovery_passwordRecovery_passwordInputHint => 'Новый пароль';

  @override
  String get passwordRecovery_passwordRecovery_repeatPasswordInputHint => 'Повторите пароль';

  @override
  String get passwordRecovery_passwordRecovery_submitRecoverButtonText => 'Восстановить';

  @override
  String get passwordRecovery_passwordRecovery_passwordRequiredSymbolsDialogTitle => 'Пароль';

  @override
  String passwordRecovery_passwordRecovery_passwordRequiredFromToSymbols(int from, int to) {
    return 'От $from до $to символов';
  }

  @override
  String get passwordRecovery_passwordRecovery_passwordRequiredSymbolsDialogLowercaseLatinLettersItem => 'Минимум одна строчная латинская буква a-z';

  @override
  String get passwordRecovery_passwordRecovery_passwordRequiredSymbolsDialogUppercaseLatinLettersItem => 'Минимум одна заглавная латинская буква A-Z';

  @override
  String get passwordRecovery_passwordRecovery_passwordRequiredSymbolsDialogDigitsItem => 'Минимум одна цифра';

  @override
  String get passwordRecovery_passwordRecovery_passwordRequiredSymbolsDialogActionText => 'OK';

  @override
  String get passwordRecovery_passwordRecovery_noRepeatedPasswordMatchMessage => 'Пароли не совпадают';

  @override
  String get passwordRecovery_passwordRecovery_connectionErrorMessage => 'Ошибка подключения';

  @override
  String get passwordRecovery_passwordRecovery_undefinedErrorMessage => 'Что-то пошло не так';

  @override
  String get passwordRecovery_emailCode_pageTitle => 'Восстановление пароля';

  @override
  String get passwordRecovery_emailCode_pageSubtitle => 'Введите код, который мы отправили вам на e-mail';

  @override
  String passwordRecovery_emailCode_attemptsLeftMessage(int current, int max) {
    String _temp0 = intl.Intl.pluralLogic(
      current,
      locale: localeName,
      other: 'Осталось $current/$max попытки',
      many: 'Осталось $current/$max попыток',
      few: 'Осталось $current/$max попытки',
      one: 'Осталась 1 попытка',
    );
    return '$_temp0';
  }

  @override
  String get passwordRecovery_emailCode_invalidCodeMessage => 'Неверный код';

  @override
  String get passwordRecovery_emailCode_noCodeMessage => 'Попытки закончились, запросите новый код';

  @override
  String get passwordRecovery_emailCode_goToEmailButtonText => 'Перейти в почту';

  @override
  String get passwordRecovery_emailCode_pasteCodeDialogTitle => 'Вставить код';

  @override
  String get passwordRecovery_emailCode_pasteCodeDialogContent => 'Вставить код';

  @override
  String get passwordRecovery_emailCode_pasteCodeDialogAffirmativeActionText => 'Да';

  @override
  String get passwordRecovery_emailCode_pasteCodeDialogNegativeActionText => 'Нет';

  @override
  String get passwordRecovery_emailCode_chooseEmailAppToGoDialogTitle => 'Выберите приложение';

  @override
  String get passwordRecovery_emailCode_resendCodeButtonText => 'Отправить повторно';

  @override
  String get passwordRecovery_emailCode_failedToResendCodeMessage => 'Не удалось отправить код';

  @override
  String get passwordRecovery_emailCode_successfullyResentCodeMessage => 'Код успешно отправлен';

  @override
  String get passwordRecovery_emailCode_connectionErrorMessage => 'Ошибка подключения';

  @override
  String get passwordRecovery_emailCode_undefinedErrorMessage => 'Что-то пошло не так';

  @override
  String get root_bottomNavigationBar_feedLabel => 'Подписки';

  @override
  String get root_bottomNavigationBar_searchLabel => 'Поиск';

  @override
  String get root_bottomNavigationBar_homeLabel => 'Главная';

  @override
  String get root_bottomNavigationBar_catalogLabel => 'Каталог';

  @override
  String get root_bottomNavigationBar_userLabel => 'Профиль';

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
    return '$day января';
  }

  @override
  String root_home_curtainHeaderDateFebruary(int day) {
    return '$day февраля';
  }

  @override
  String root_home_curtainHeaderDateMarch(int day) {
    return '$day марта';
  }

  @override
  String root_home_curtainHeaderDateApril(int day) {
    return '$day апреля';
  }

  @override
  String root_home_curtainHeaderDateMay(int day) {
    return '$day мая';
  }

  @override
  String root_home_curtainHeaderDateJune(int day) {
    return '$day июня';
  }

  @override
  String root_home_curtainHeaderDateJuly(int day) {
    return '$day июля';
  }

  @override
  String root_home_curtainHeaderDateAugust(int day) {
    return '$day августа';
  }

  @override
  String root_home_curtainHeaderDateSeptember(int day) {
    return '$day сентября';
  }

  @override
  String root_home_curtainHeaderDateOctober(int day) {
    return '$day октября';
  }

  @override
  String root_home_curtainHeaderDateNovember(int day) {
    return '$day ноября';
  }

  @override
  String root_home_curtainHeaderDateDecember(int day) {
    return '$day декабря';
  }

  @override
  String get root_home_curtainContentTitle => 'Сегодня';

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
    return 'Ощущается как $temperature°C';
  }

  @override
  String root_home_curtainContentFeelsLikeTemperatureFahrenheitText(String temperature) {
    return 'Ощущается как $temperature°F';
  }

  @override
  String get root_home_curtainContentPrecipitationsTitle => 'Осадки';

  @override
  String root_home_curtainContentPrecipitationsValueMetricText(int precipitations) {
    return '$precipitations мм';
  }

  @override
  String root_home_curtainContentPrecipitationsValueImperialText(Object precipitations) {
    return '$precipitations инч';
  }

  @override
  String get root_home_curtainContentHumidityTitle => 'Влажность';

  @override
  String root_home_curtainContentHumidityValueText(int humidity) {
    return '$humidity%';
  }

  @override
  String get root_home_curtainContentWindSpeedTitle => 'Ветер';

  @override
  String root_home_curtainContentWindSpeedValueMetricText(int windSpeed) {
    return '$windSpeed м/с';
  }

  @override
  String root_home_curtainContentWindSpeedValueImperialText(int windSpeed) {
    return '$windSpeed м/ч';
  }

  @override
  String get root_home_curtainContentPressureTitle => 'Давление';

  @override
  String root_home_curtainContentPressureValueMetricText(int pressure) {
    return '$pressure мм рт ст';
  }

  @override
  String root_home_curtainContentPressureValueImperialText(Object pressure) {
    return '$pressure инч рт ст';
  }

  @override
  String root_home_curtainContentWeatherForecastTitle(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Погода на $days дня',
      many: 'Погода на $days дней',
      few: 'Погода на $days дня',
      one: 'Погода на 1 день',
    );
    return '$_temp0';
  }

  @override
  String get root_home_curtainContentWeatherForecastItemDaysOfWeekAbbreviationsMonday => 'Пн';

  @override
  String get root_home_curtainContentWeatherForecastItemDaysOfWeekAbbreviationsTuesday => 'Вт';

  @override
  String get root_home_curtainContentWeatherForecastItemDaysOfWeekAbbreviationsWednesday => 'Ср';

  @override
  String get root_home_curtainContentWeatherForecastItemDaysOfWeekAbbreviationsThursday => 'Чт';

  @override
  String get root_home_curtainContentWeatherForecastItemDaysOfWeekAbbreviationsFriday => 'Пт';

  @override
  String get root_home_curtainContentWeatherForecastItemDaysOfWeekAbbreviationsSaturday => 'Сб';

  @override
  String get root_home_curtainContentWeatherForecastItemDaysOfWeekAbbreviationsSunday => 'Вс';

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
  String get root_home_weatherLoadingConnectionErrorMessage => 'Отсутствует подключение к интернету';

  @override
  String get root_home_weatherLoadingUndefinedErrorMessageTitle => 'Что-то пошло не так';

  @override
  String get root_home_weatherLoadingUndefinedErrorMessageSubtitle => 'Техническая ошибка, мы решаем вопрос';

  @override
  String get root_home_weatherLoadingTryAgainButtonText => 'Повторить попытку';

  @override
  String get root_home_choicesLoadingConnectionErrorMessage => 'Отсутствует подключение к интернету';

  @override
  String get root_home_choicesLoadingUndefinedErrorMessageTitle => 'Что-то пошло не так';

  @override
  String get root_home_choicesLoadingUndefinedErrorMessageSubtitle => 'Техническая ошибка, мы решаем вопрос';

  @override
  String get root_home_choicesLoadingTryAgainButtonText => 'Повторить попытку';

  @override
  String root_user_looksCountText(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Луков',
      few: 'Лука',
      one: 'Лук',
      zero: 'Луков',
    );
    return '$_temp0';
  }

  @override
  String root_user_followersCountText(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Подписчиков',
      few: 'Подписчика',
      one: 'Подписчик',
    );
    return '$_temp0';
  }

  @override
  String root_user_followsCountText(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Подписок',
      few: 'Подписки',
      one: 'Подписка',
    );
    return '$_temp0';
  }

  @override
  String get root_followers_search_input_hint => 'Поиск';

  @override
  String get root_follows_search_input_hint => 'Поиск';

  @override
  String get common_lists_loadingConnectionErrorMessage => 'Отсутствует подключение к интернету';

  @override
  String get common_lists_loadingUndefinedErrorMessageTitle => 'Что-то пошло не так';

  @override
  String get common_lists_loadingUndefinedErrorMessageSubtitle => 'Техническая ошибка, мы решаем вопрос';

  @override
  String get common_lists_loadingTryAgainButtonText => 'Повторить попытку';
}
