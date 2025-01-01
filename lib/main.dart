import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/app/config/route/app_route_config.dart';
import 'package:portfolio/app/config/theme/app_theme/desktop_theme.dart';
import 'package:portfolio/app/config/theme/app_theme/mobile_theme.dart';
import 'package:portfolio/app/config/theme/dimension/desktop_dimension.dart';
import 'package:portfolio/app/config/theme/dimension/mobile_dimension.dart';
import 'package:portfolio/app/utils/responsive/responsive.dart';
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
    return ScreenUtilInit(
      designSize: Responsive.isDesktop(context) ? DesktopDimension.desktopDesignSize : MobileDimension.mobileDesignSize,
      minTextAdapt: true,
      child: BlocProvider(
        create:(context)=> injector.get<ThemeCubit>(),
        child: BlocBuilder<ThemeCubit,ThemeState>(
          builder: (context,state) {
            return MaterialApp.router(
              title: 'Arkar Min',
              debugShowCheckedModeBanner: false,
              theme: state.when(
                  light: ()=> Responsive.isDesktop(context) ? DesktopTheme.lightTheme : MobileTheme.lightTheme,
                  dark: ()=>  Responsive.isDesktop(context) ? DesktopTheme.darkTheme : MobileTheme.darkTheme,
              ),
              routerConfig: AppRouteConfig.goRouter,
            );
          }
        ),
      ),
    );
  }
}


