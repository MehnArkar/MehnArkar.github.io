import 'package:get_it/get_it.dart';
import 'package:portfolio/features/project/data/repositories/project_repository.dart';
import 'package:portfolio/features/project/view_model/project_bloc/project_bloc.dart';
import 'package:portfolio/features/project/view_model/project_slider_bloc/project_slider_bloc.dart';
import '../../features/index/view/bloc/cursor_cubit/cursor_cubit.dart';
import '../../features/index/view/bloc/nav_bar_cubit/nav_bar_cubit.dart';
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
    injector.registerLazySingleton<ProjectRepository>(()=>ProjectRepository());
  }

  static void _injectBloc(){
    injector.registerFactory(() => ThemeCubit());
    injector.registerFactory(() => CursorCubit());
    injector.registerFactory(()=> NavBarCubit());
    injector.registerFactory(()=> ProjectBloc(projectRepository: injector.get()));
    injector.registerFactory(()=>ProjectSliderBloc());
  }
}