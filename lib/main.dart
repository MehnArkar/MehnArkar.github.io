import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'app/core/presentation/bloc/theme_cubit/theme_cubit.dart';
import 'app/core/presentation/bloc/theme_cubit/theme_state.dart';
import 'app/utils/service_locator.dart';
import 'features/index/presentation/pages/index_page.dart';

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
          return MaterialApp(
            title: 'Arkar Min',
            debugShowCheckedModeBanner: false,
            theme: state.when(
                light: ()=> ThemeData.light(),
                dark: ()=> ThemeData.dark()
            ),
            home: const IndexPage(),
          );
        }
      ),
    );
  }
}


