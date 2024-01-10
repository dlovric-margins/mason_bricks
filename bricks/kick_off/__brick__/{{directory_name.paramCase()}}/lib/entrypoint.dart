import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:{{project_name.snakeCase()}}/app/app_bloc/app_bloc.dart';
import 'package:{{project_name.snakeCase()}}/app/services/service_locator.dart';
import 'package:{{project_name.snakeCase()}}/app/router/router.dart';

@RoutePage()
class EntryPointScreen extends StatefulWidget {
  const EntryPointScreen({super.key});

  @override
  State<EntryPointScreen> createState() => _EntryPointScreenState();
}

class _EntryPointScreenState extends State<EntryPointScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AppBloc>()..add(const AppEvent.checkStatus()),
      child: Builder(
        builder: (context) {
          return BlocListener<AppBloc, AppState>(
            listener: (context, state) {
              state.when(
                loading: () {},
                authenticated: () {},
                unauthenticated: () {
                  context.router.push(const DummyRoute());
                },
              );
            },
            child: AutoRouter(
              // navigatorObservers: () => [],
              // placeholder: routerPlaceholder,
              builder: (context, child) => Builder(
                builder: (_) {
                  return child;
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
