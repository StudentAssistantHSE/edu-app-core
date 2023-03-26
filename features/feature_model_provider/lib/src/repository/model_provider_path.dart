import 'package:feature_model_provider/src/repository/model_provider_paths.dart';

enum ModelProviderPath {
  account,
}

extension ModelProviderPathConverter on ModelProviderPath {
  String get asPath {
    switch (this) {
      case ModelProviderPath.account:
        return ModelProviderPaths.account;
    }
  }
}