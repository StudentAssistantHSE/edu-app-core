import 'package:edu_ui_components/src/themes/models/models.dart';
import 'package:edu_ui_components/src/widgets/buttons/edu_base_button.dart';

class EduGradientButton extends EduBaseButton {
  const EduGradientButton({
    super.text = '',
    super.useGuard = false,
    super.onPressed,
    super.expand = true,
    super.key,
  });

  @override
  EduButtonTheme buttonThemeOf(EduThemeData theme) => EduButtonTheme(
    foregroundColor: theme.gradientButtonTheme.foregroundColor,
    textStyle: theme.gradientButtonTheme.textStyle,
    disabledOpacity: theme.gradientButtonTheme.disabledOpacity,
    gradient: theme.gradientButtonTheme.gradient,
  );
}