import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/app/utils/extensions/context_extension.dart';
import 'package:portfolio/app/utils/responsive/responsive.dart';
import 'package:portfolio/app/utils/responsive/responsive_layout.dart';
import 'package:portfolio/features/project/view/pages/mobile_project_page.dart';
import 'package:portfolio/features/project/view_model/project_bloc/project_bloc.dart';
import 'package:portfolio/features/project/view_model/project_slider_bloc/project_slider_bloc.dart';
import '../../../../app/utils/service_locator.dart';
import '../../../about/view/pages/desktop_about_page.dart';
import '../../../about/view/pages/mobile_about_page.dart';
import '../../../home/view/pages/desktop_home_page.dart';
import '../../../home/view/pages/mobile_home_page.dart';
import '../../../project/view/pages/desktop_projects_page.dart';
import '../bloc/curdor_cubit/cursor_cubit.dart';
import '../bloc/nav_bar_cubit/nav_bar_cubit.dart';
import '../widgets/cursor_widget.dart';
import '../widgets/top_nav_bar.dart';

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
                  // const AnimatedPageBackground(),

                  ///Page context
                  SizedBox(
                    width: double.maxFinite,
                    height: context.sh,
                    child: ListView(
                      padding: EdgeInsets.zero,
                      children:  [
                        //Home Page
                        const ResponsiveLayout(
                          mobile:  MobileHomePage(),
                          tablet:  MobileHomePage(),
                          desktop:  DesktopHomePage()
                        ),
                        //About Page
                        const ResponsiveLayout(
                          desktop: DesktopAboutPage(),
                          mobile: MobileAboutPage(),
                          tablet: MobileAboutPage(),
                        ),
                        //Featured Projects Page
                        MultiBlocProvider(
                          providers: [
                            BlocProvider(create: (_)=>injector.get<ProjectBloc>()),
                            BlocProvider(create: (_)=>injector.get<ProjectSliderBloc>())
                          ],
                          child:  ResponsiveLayout(
                            desktop: DesktopProjectsPage(),
                            mobile: const MobileProjectPage(),
                            tablet: const MobileProjectPage(),

                          ),
                        )
                      ],
                    ),
                  ),

                  /// NavBar
                  const TopNavBar(),


                  /// Cursor
                  if(Responsive.isDesktop(context))
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



