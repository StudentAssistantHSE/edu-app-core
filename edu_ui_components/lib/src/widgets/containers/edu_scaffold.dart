import 'package:edu_ui_components/src/themes/edu_theme.dart';
import 'package:edu_ui_components/src/themes/models/models.dart';
import 'package:edu_ui_components/src/widgets/containers/edu_app_bar.dart';
import 'package:edu_ui_components/src/widgets/containers/wave_app_bar.dart';
import 'package:flutter/material.dart' hide IconButton;

class WaveAppBarSettings {
  final WaveAppBar waveAppBar;
  final bool automaticallyApplyLeading;
  final Widget? leading;

  const WaveAppBarSettings({
    required this.waveAppBar,
    this.automaticallyApplyLeading = true,
    this.leading,
  });
}

class EduScaffold extends StatelessWidget {
  final bool useSafeArea;
  final PreferredSizeWidget? appBar;
  final bool resizeToAvoidBottomInset;
  final Widget? body;
  final Widget? bottomNavigationBar;
  final WaveAppBarSettings? waveAppBarSettings;
  final Widget? floatingActionButton;

  const EduScaffold({
    this.appBar,
    this.body,
    this.bottomNavigationBar,
    this.resizeToAvoidBottomInset = true,
    this.useSafeArea = true,
    this.waveAppBarSettings,
    this.floatingActionButton,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var content = body;

    if (waveAppBarSettings != null) {
      content = Column(
        children: [
          waveAppBarSettings?.waveAppBar ?? const SizedBox.shrink(),
          if (content != null)
            Expanded(
              child: content,
            ),
        ],
      );
    }

    if (useSafeArea) {
      content = SafeArea(
        top: waveAppBarSettings == null,
        child: content ?? const SizedBox.shrink(),
      );
    }

    final theme = EduTheme.of(context);
    return Scaffold(
      backgroundColor: theme.scaffoldTheme.backgroundColor.resolveColorScheme(theme.colorScheme),
      extendBodyBehindAppBar: waveAppBarSettings != null,
      appBar: waveAppBarSettings != null ? EduAppBar(
        backgroundColor: ColorSchemeReference.transparent,
        foregroundColor: ColorSchemeReference.themeMain,
        leading: waveAppBarSettings?.leading,
        automaticallyImplyLeading: waveAppBarSettings?.automaticallyApplyLeading ?? true,
        bottomBorder: EduAppBarBottomBorderType.none,
      ) : appBar,
      floatingActionButton: floatingActionButton,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      body: content,
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}