
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part '{{ feature_name.snakeCase() }}_state.dart';
part '{{ feature_name.snakeCase() }}_cubit.freezed.dart';

class {{ feature_name.pascalCase() }}Cubit extends Cubit<{{ feature_name.pascalCase() }}State> {
  {{ feature_name.pascalCase() }}Cubit() : super(const {{ feature_name.pascalCase() }}State.initial());
}
