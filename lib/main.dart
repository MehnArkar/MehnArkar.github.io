import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/app/config/route/app_route_config.dart';
import 'package:portfolio/app/config/theme/app_theme/app_theme.dart';
import 'app/core/presentation/bloc/theme_cubit/theme_cubit.dart';
import 'app/core/presentation/bloc/theme_cubit/theme_state.dart';
import 'app/utils/service_locator.dart';

void main() {
  ServiceLocator.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:(context)=> injector.get<ThemeCubit>(),
      child: BlocBuilder<ThemeCubit,ThemeState>(
        builder: (context,state) {
          return MaterialApp.router(
            title: 'Arkar Min',
            debugShowCheckedModeBanner: false,
            theme: state.when(
                light: ()=> AppTheme.createLightTheme(context),
                dark: ()=>  AppTheme.createDarkTheme(context),
            ),
            routerConfig: AppRouteConfig.goRouter,
          );
        }
      ),
    );
  }
}


