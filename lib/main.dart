import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/config/theme/app_theme.dart';
import 'package:portfolio/core/bloc/theme_bloc/theme_cubit.dart';
import 'package:portfolio/core/bloc/theme_bloc/theme_state.dart';
import 'package:portfolio/core/utils/service_locator.dart';
import 'package:portfolio/features/index/index_page.dart';

void main() {
  ServiceLocator.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:(context)=> injector.get<ThemeCubit>(),
      child: BlocBuilder<ThemeCubit,ThemeState>(
        builder: (context,state) {
          return MaterialApp(
            title: 'Arkar Min',
            debugShowCheckedModeBanner: false,
            theme: state.when(
                light: ()=> AppTheme.light,
                dark: ()=> AppTheme.dark
            ),
            home: const IndexPage(),
          );
        }
      ),
    );
  }
}


