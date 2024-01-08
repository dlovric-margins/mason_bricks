import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';

part '{{ feature_name }}_source.g.dart';


@RestApi()
@singleton
abstract class {{ feature_name.pascalCase() }}Source {
  @factoryMethod
  factory {{ feature_name.pascalCase() }}Source(Dio dio) = _{{ feature_name.pascalCase() }}Source;
}
