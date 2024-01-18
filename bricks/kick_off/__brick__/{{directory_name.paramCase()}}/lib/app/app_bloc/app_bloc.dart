import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:{{project_name.snakeCase()}}/app/services/service_locator.dart';
import 'package:{{project_name.snakeCase()}}/app/storage/{{project_name.snakeCase()}}_secure_storage.dart';
import 'package:injectable/injectable.dart';

part 'app_event.dart';
part 'app_state.dart';
part 'app_bloc.freezed.dart';

@singleton
class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(const AppState.loading()) {
    on<AppEvent>((event, emit) async {
      
      Future<void> logOut() async {
        await sl<SecureStorage>().clearStorage();
        emit(const AppState.unauthenticated());
      }

      await event.when(
        checkStatus: () async {
          final accessToken = await sl<SecureStorage>().getAccessToken();
          if (accessToken == null) await logOut();

          try {
            // get user asnycronously
            emit(const AppState.authenticated());
          } catch (e) {
            await logOut();
          }
        },
        logOut: () async {
          await logOut();
        },
      );
    });
  }
}
