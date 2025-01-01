import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/app/core/presentation/bloc/theme_cubit/theme_state.dart';

class ThemeCubit extends Cubit<ThemeState>{
  ThemeCubit():super(const ThemeState.light());

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