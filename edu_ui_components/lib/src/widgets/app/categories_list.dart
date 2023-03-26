import 'package:edu_models/edu_models.dart';
import 'package:edu_ui_components/src/themes/edu_theme.dart';
import 'package:edu_ui_components/src/themes/models/referencable/edu_color_scheme.dart';
import 'package:edu_ui_components/src/themes/models/referencable/edu_text_theme.dart';
import 'package:flutter/material.dart';

class CategoriesList extends StatelessWidget {
  final List<CategoryModel> categories;

  const CategoriesList({ required this.categories, Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = EduTheme.of(context);
    return Wrap(
      spacing: theme.categoriesListTheme.spacing,
      runSpacing: theme.categoriesListTheme.spacing,
      children: [
        for (final category in categories)
          Chip(
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            side: BorderSide.none,
            shape: const StadiumBorder(),
            backgroundColor: theme.categoriesListTheme.backgroundColor
                .resolveColorScheme(theme.colorScheme),
            label: Text(
              category.category,
              style: theme.categoriesListTheme.labelStyle.resolveTextTheme(theme.textTheme)
                  .copyWith(color: theme.categoriesListTheme.foregroundColor.resolveColorScheme(theme.colorScheme)),
            ),
          ),
      ],
    );
  }
}