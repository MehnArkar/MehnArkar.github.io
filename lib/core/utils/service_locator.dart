import 'package:get_it/get_it.dart';
import 'package:portfolio/core/bloc/theme_bloc/theme_cubit.dart';
import 'package:portfolio/features/index/bloc/cursor_cubit.dart';

GetIt injector = GetIt.instance;

class ServiceLocator {
  static init(){
    injectBloc();
  }

  static injectBloc(){
    injector.registerFactory(() => ThemeCubit());
    injector.registerFactory(() => CursorCubit());
  }
}