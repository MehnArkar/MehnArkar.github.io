import 'package:get_it/get_it.dart';
import 'package:portfolio/features/index/presentation/bloc/nav_bar_cubit/nav_bar_cubit.dart';
import '../../features/index/presentation/bloc/curdor_cubit/cursor_cubit.dart';
import '../core/presentation/bloc/theme_cubit/theme_cubit.dart';

GetIt injector = GetIt.instance;

class ServiceLocator {

  static void init(){
    _injectDataSource();
    _injectRepository();
    _injectBloc();
  }

  static void _injectDataSource(){
    //inject data source here
  }

  static void _injectRepository(){
    //inject repository here
  }

  static void _injectBloc(){
    injector.registerFactory(() => ThemeCubit());
    injector.registerFactory(() => CursorCubit());
    injector.registerFactory(()=> NavBarCubit());
  }
}