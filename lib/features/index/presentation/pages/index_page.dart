import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/app/utils/extensions/context_extension.dart';
import 'package:portfolio/app/utils/responsive/responsive.dart';
import 'package:portfolio/app/utils/responsive/responsive_layout.dart';
import 'package:portfolio/features/home/presentation/pages/desktop_home_page.dart';
import 'package:portfolio/features/index/presentation/bloc/nav_bar_cubit/nav_bar_cubit.dart';
import 'package:portfolio/features/index/presentation/widgets/animated_theme_switch_button.dart';
import 'package:portfolio/features/index/presentation/widgets/top_nav_bar.dart';
import '../../../../app/utils/service_locator.dart';
import '../bloc/curdor_cubit/cursor_cubit.dart';
import '../widgets/cursor_widget.dart';

class IndexPage extends StatelessWidget {
  const IndexPage._({super.key});

  static Widget create(){
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>injector.get<CursorCubit>()),
        BlocProvider(create: (context)=>injector.get<NavBarCubit>())
      ],
      child:const IndexPage._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorScheme.surface,
      body: BlocBuilder<CursorCubit,Offset>(
          builder: (context,state) {
          return MouseRegion(
            onHover: (event)=> context.read<CursorCubit>().onCursorChange(event.position),
            child:  SizedBox(
              width: double.maxFinite,
              height: context.sh,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  ///Page context
                  SizedBox(
                    width: double.maxFinite,
                    height: context.sh,
                    child: ListView(
                      padding: EdgeInsets.zero,
                      children: [
                        ResponsiveLayout(
                          mobile: Center(child: Text("Mobile",style: context.textTheme.bodyMedium,)),
                          tablet: Center(child: Text("tablet",style: context.textTheme.bodyMedium,)),
                          desktop: const DesktopHomePage(),
                          watch: Center(child: Text("watch",style: context.textTheme.bodyMedium)),
                        ),

                        ResponsiveLayout(
                          desktop: SizedBox(
                            width: double.maxFinite,
                            height: context.sh,
                            child: Center(
                              child: AnimatedThemeSwitchButton(),
                            )
                          ),
                        )
                      ],
                    ),
                  ),

                  /// NavBar
                  const TopNavBar(),


                  /// Cursor
                  if(kIsWeb)
                  const CursorWidget(),
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}



