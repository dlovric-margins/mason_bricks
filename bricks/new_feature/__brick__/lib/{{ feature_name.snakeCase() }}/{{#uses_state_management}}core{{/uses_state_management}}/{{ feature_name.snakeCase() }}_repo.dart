import 'package:injectable/injectable.dart';

class {{ feature_name.pascalCase() }}Repo {}

@Singleton(as: {{ feature_name.pascalCase() }}Repo
class {{ feature_name.pascalCase() }}RepoImpl extends {{ feature_name.pascalCase() }}Repo {}