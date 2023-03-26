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
  String get login_login_incorrectCredentialsMessage => 'Неверные учетные данные';

  @override
  String get login_login_connectionErrorMessage => 'Ошибка подключения';

  @override
  String get login_login_undefinedErrorMessage => 'Что-то пошло не так';

  @override
  String get registration_registration_pageTitle => 'Регистрация';

  @override
  String get registration_registration_emailInputHint => 'E-mail';

  @override
  String get registration_registration_usernameInputHint => 'Имя пользователя';

  @override
  String get registration_registration_passwordInputHint => 'Пароль';

  @override
  String get registration_registration_repeatPasswordInputHint => 'Повторите пароль';

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
  String get registration_registration_submitRegistrationButtonText => 'Зарегистрироваться';

  @override
  String get registration_registration_noRepeatedPasswordMatchMessage => 'Пароли не совпадают';

  @override
  String get registration_registration_connectionErrorMessage => 'Ошибка подключения';

  @override
  String get registration_registration_undefinedErrorMessage => 'Что-то пошло не так';

  @override
  String get registration_finishRegistration_pageTitle => 'Поздравляем!';

  @override
  String get registration_finishRegistration_pageSubtitle => 'Вы успешно прошли регистрацию';

  @override
  String get registration_finishRegistration_startButtonText => 'Начинаем';

  @override
  String get root_bottomNavigationBar_recommendationsLabel => 'Для вас';

  @override
  String get root_bottomNavigationBar_searchLabel => 'Поиск';

  @override
  String get root_bottomNavigationBar_myProjectsLabel => 'Мои проекты';

  @override
  String get root_bottomNavigationBar_applicationsLabel => 'Заявки';

  @override
  String get root_bottomNavigationBar_userLabel => 'Профиль';

  @override
  String get root_projects_search_input_hint => 'Поиск';

  @override
  String get root_projects_projectCard_contactsTitle => 'Контакты:';

  @override
  String get root_projects_projectCard_nameTitle => 'Название:';

  @override
  String get root_projects_projectCard_descriptionTitle => 'Описание:';

  @override
  String get root_projects_projectCard_applyButtonText => 'Записаться';

  @override
  String get root_projects_projectCard_recommendationsText => 'Рекоммендации';

  @override
  String get root_applications_sentApplicationsTabTitle => 'Исходящие';

  @override
  String get root_applications_incomingApplicationsTabTitle => 'Входящие';

  @override
  String get root_applications_applicationCard_messageTitle => 'Сопроводительное сообщение:';

  @override
  String get root_applications_applicationCard_statusTitle => 'Статус:';

  @override
  String get root_applications_applicationCard_statusAppliedText => 'ожидает рассмотрения';

  @override
  String get root_applications_applicationCard_statusRejectedText => 'отклонено';

  @override
  String get root_applications_applicationCard_statusAcceptedText => 'принято';

  @override
  String get root_applications_applicationCard_processApplicationRejectText => 'Отклонить';

  @override
  String get root_applications_applicationCard_processApplicationAcceptText => 'Принять';

  @override
  String get root_applyProject_messageInputHint => 'Сообщение...';

  @override
  String get root_applyProject_applyButtonText => 'Записаться';

  @override
  String get root_applyProject_alreadyAppliedErrorMessage => 'Вы уже записаны';

  @override
  String get root_applyProject_connectionErrorMessage => 'Отсутствует подключение к интернету';

  @override
  String get root_applyProject_undefinedErrorMessage => 'Что-то пошло не так';

  @override
  String get root_createProject_createButtonText => 'Создать';

  @override
  String get root_createProject_nameInputHint => 'Название';

  @override
  String get root_createProject_descriptionInputHint => 'Описание';

  @override
  String get root_createProject_contactsInputHint => 'Контакты';

  @override
  String get root_createProject_categoriesText => 'Категории';

  @override
  String get root_createProject_categoriesInputHint => 'Начните вводить...';

  @override
  String get root_createProject_connectionErrorMessage => 'Отсутствует подключение к интернету';

  @override
  String get root_createProject_undefinedErrorMessage => 'Что-то пошло не так';

  @override
  String get root_profile_connectionErrorMessage => 'Отсутствует подключение к интернету';

  @override
  String get root_profile_undefinedErrorMessageTitle => 'Что-то пошло не так';

  @override
  String get root_profile_undefinedErrorMessageSubtitle => 'Техническая ошибка, мы решаем вопрос';

  @override
  String get root_profile_tryAgainButtonText => 'Повторить попытку';

  @override
  String get root_profile_emailTitle => 'E-mail';

  @override
  String get root_profile_fullNameTitle => 'Полное имя';

  @override
  String get root_profile_facultyTitle => 'Факультет';

  @override
  String get root_profile_facultyNotSetText => 'Не указан';

  @override
  String get root_profile_bioTitle => 'О себе';

  @override
  String get root_profile_bioNotSetText => 'Не указано';

  @override
  String get root_profile_categoriesTitle => 'Навыки';

  @override
  String get root_profile_categoriesNotSetText => 'Не указаны';

  @override
  String get root_profile_logoutButtonText => 'Выйти';

  @override
  String get root_profileEditing_connectionErrorMessage => 'Отсутствует подключение к интернету';

  @override
  String get root_profileEditing_undefinedErrorMessageTitle => 'Что-то пошло не так';

  @override
  String get root_profileEditing_undefinedErrorMessageSubtitle => 'Техническая ошибка, мы решаем вопрос';

  @override
  String get root_profileEditing_tryAgainButtonText => 'Повторить попытку';

  @override
  String get root_profileEditing_emailTitle => 'E-mail';

  @override
  String get root_profileEditing_emailInputHint => 'E-mail';

  @override
  String get root_profileEditing_fullNameTitle => 'Полное имя';

  @override
  String get root_profileEditing_fullNameInputHint => 'Полное имя';

  @override
  String get root_profileEditing_facultyTitle => 'Факультет';

  @override
  String get root_profileEditing_facultyNotSetText => 'Не указан';

  @override
  String get root_profileEditing_bioTitle => 'О себе';

  @override
  String get root_profileEditing_bioNotSetText => 'Не указано';

  @override
  String get root_profileEditing_categoriesTitle => 'Навыки';

  @override
  String get root_profileEditing_categoriesInputHint => 'Начните вводить...';

  @override
  String get root_profileEditing_submitButtonText => 'Сохранить';

  @override
  String get common_lists_loading_noItemsMessage => 'Ничего не найдено';

  @override
  String get common_lists_loading_connectionErrorMessage => 'Отсутствует подключение к интернету';

  @override
  String get common_lists_loading_undefinedErrorMessageTitle => 'Что-то пошло не так';

  @override
  String get common_lists_loading_undefinedErrorMessageSubtitle => 'Техническая ошибка, мы решаем вопрос';

  @override
  String get common_lists_loading_tryAgainButtonText => 'Повторить попытку';
}
