import 'package:edu_ui_components/src/themes/models/models.dart';
import 'package:edu_ui_components/src/widgets/buttons/edu_base_button.dart';

class EduOutlinedButton extends EduBaseButton {
  const EduOutlinedButton({
    super.text = '',
    super.useGuard = false,
    super.onPressed,
    super.expand = true,
    super.key,
  });

  @override
  EduButtonTheme buttonThemeOf(EduThemeData theme) => EduButtonTheme(
    foregroundColor: theme.outlinedButtonTheme.outlineColor,
    textStyle: theme.outlinedButtonTheme.textStyle,
    disabledOpacity: theme.outlinedButtonTheme.disabledOpacity,
    borderColor: theme.outlinedButtonTheme.outlineColor,
    borderWidth: theme.outlinedButtonTheme.borderWidth,
  );
}