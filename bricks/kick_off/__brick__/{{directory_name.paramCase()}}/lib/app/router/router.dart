import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';
import 'package:{{project_name.snakeCase()}}/entrypoint.dart';
import 'package:{{project_name.snakeCase()}}/dummy_screen.dart';


part 'router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
@singleton
class AppRouter extends _$AppRouter {
  @override
  final List<AutoRoute> routes = [
    AutoRoute(
      path: '/',
      page: EntryPointRoute.page,
      children: [
        AutoRoute(
          page: DummyRoute.page,
        ),
      ],
    ),
  ];
}
