import 'package:feature_models_list_provider/src/repository/models_list_provider_keys.dart';
import 'package:feature_models_list_provider/src/repository/models_list_provider_paths.dart';

enum ModelsListProviderPath {
  projects,
  myProjects,
  sentApplications,
  incomingApplications,
  projectsCategories,
  accountCategories,
  faculties,
  recommendations,
}

extension ModelsListProviderPathConverter on ModelsListProviderPath {
  String get asPath {
    switch (this) {
      case ModelsListProviderPath.projects:
        return ModelsListProviderPaths.projects;
      case ModelsListProviderPath.myProjects:
        return ModelsListProviderPaths.myProjects;
      case ModelsListProviderPath.sentApplications:
        return ModelsListProviderPaths.sentApplications;
      case ModelsListProviderPath.incomingApplications:
        return ModelsListProviderPaths.incomingApplications;
      case ModelsListProviderPath.projectsCategories:
        return ModelsListProviderPaths.projectsCategories;
      case ModelsListProviderPath.accountCategories:
        return ModelsListProviderPaths.accountCategories;
      case ModelsListProviderPath.faculties:
        return ModelsListProviderPaths.faculties;
      case ModelsListProviderPath.recommendations:
        return ModelsListProviderPaths.recommendations;
    }
  }

  String? get asKey {
    switch (this) {
      case ModelsListProviderPath.projects:
        return ModelsListProviderKeys.projects;
      case ModelsListProviderPath.myProjects:
        return ModelsListProviderKeys.projects;
      case ModelsListProviderPath.incomingApplications:
        return ModelsListProviderKeys.listToMap;
      case ModelsListProviderPath.sentApplications:
        return ModelsListProviderKeys.listToMap;
      case ModelsListProviderPath.projectsCategories:
        return ModelsListProviderKeys.listToMap;
      case ModelsListProviderPath.accountCategories:
        return ModelsListProviderKeys.listToMap;
      case ModelsListProviderPath.faculties:
        return ModelsListProviderKeys.listToMap;
      case ModelsListProviderPath.recommendations:
        return ModelsListProviderKeys.listToMap;
    }
  }
}