import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:{{project_name.snakeCase()}}/app/router/router.dart';
import 'package:{{project_name.snakeCase()}}/app/services/service_locator.dart';
import 'package:{{project_name.snakeCase()}}/app/storage/{{project_name.snakeCase()}}_storage.dart';
import 'package:{{project_name.snakeCase()}}/app/theme/{{project_name.snakeCase()}}_theme.dart';
import 'package:{{project_name.snakeCase()}}/app/theme/theme_cubit/theme_cubit.dart';


class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: sl.allReady(timeout: const Duration(milliseconds: 500)),
      builder: (context, widget) {
        // FlutterNativeSplash.remove();
        return BlocProvider.value(
          value: sl<ThemeCubit>()..initTheme(),
          child: ScreenUtilInit(
            designSize: const Size(360, 800),
            builder: (context, child) {
              return LayoutBuilder(
                builder: (context, con) {
                  sl<{{project_name.pascalCase()}}Storage>().isTablet = con.maxWidth > 600;
                  return BlocBuilder<ThemeCubit, ThemeState>(
                    builder: (context, state) {
                      return state.when(
                        themeMode: (mode, _) {
                          return MaterialApp.router(
                            debugShowCheckedModeBanner: false,
                            routerDelegate: sl<AppRouter>().delegate(),
                            routeInformationParser:
                                sl<AppRouter>().defaultRouteParser(),
                            theme: {{project_name.pascalCase()}}Theme.light,
                            darkTheme: {{project_name.pascalCase()}}Theme.dark,
                            themeMode: mode,
                            // localizationsDelegates: const [
                            //   AppLocalizations.delegate,
                            //   GlobalMaterialLocalizations.delegate,
                            //   FormBuilderLocalizations.delegate,
                            // ],
                            // supportedLocales: AppLocalizations.supportedLocales,
                          );
                        },
                      );
                    },
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}
