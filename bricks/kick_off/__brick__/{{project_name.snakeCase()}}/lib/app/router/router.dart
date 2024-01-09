import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';

part 'router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
@singleton
class AppRouter extends _$AppRouter {
  @override
  final List<AutoRoute> routes = [
    //example: AutoRoute(page: HomeRoute.page, initial: true)
  ];
}
