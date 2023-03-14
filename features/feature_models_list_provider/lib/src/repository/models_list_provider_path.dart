import 'package:feature_models_list_provider/src/repository/models_list_provider_keys.dart';
import 'package:feature_models_list_provider/src/repository/models_list_provider_paths.dart';

enum ModelsListProviderPath {
  projects,
  myProjects,
}

extension ModelsListProviderPathConverter on ModelsListProviderPath {
  String get asPath {
    switch (this) {
      case ModelsListProviderPath.projects:
        return ModelsListProviderPaths.projects;
      case ModelsListProviderPath.myProjects:
        return ModelsListProviderPaths.myProjects;
    }
  }

  String get asKey {
    switch (this) {
      case ModelsListProviderPath.projects:
        return ModelsListProviderKeys.projects;
      case ModelsListProviderPath.myProjects:
        return ModelsListProviderKeys.projects;
    }
  }
}