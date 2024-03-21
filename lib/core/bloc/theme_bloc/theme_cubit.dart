import 'package:bloc/bloc.dart';
import 'package:portfolio/core/bloc/theme_bloc/theme_state.dart';


class ThemeCubit extends Cubit<ThemeState>{
  ThemeCubit():super(const ThemeState.dark());

  onChangeTheme(){
    state.when(
        light: (){
          emit(const ThemeState.dark());
        },
        dark: (){
          emit(const ThemeState.light());
        }
    );
  }
}