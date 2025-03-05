import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/app/utils/extensions/context_extension.dart';
import 'package:portfolio/app/utils/responsive/responsive.dart';
import 'package:portfolio/app/utils/responsive/responsive_layout.dart';
import 'package:portfolio/features/contact/view/pages/desktop_contact_page.dart';
import 'package:portfolio/features/contact/view/pages/mobile_contact_page.dart';
import 'package:portfolio/features/index/data/models/nab_bar_type.dart';
import 'package:portfolio/features/index/view/widgets/page_indicator.dart';
import 'package:portfolio/features/project/view/pages/mobile_project_page.dart';
import 'package:portfolio/features/project/view_model/project_bloc/project_bloc.dart';
import 'package:portfolio/features/project/view_model/project_slider_bloc/project_slider_bloc.dart';
import '../../../../app/utils/service_locator.dart';
import '../../../about/view/pages/desktop_about_page.dart';
import '../../../about/view/pages/mobile_about_page.dart';
import '../../../home/view/pages/desktop_home_page.dart';
import '../../../home/view/pages/mobile_home_page.dart';
import '../../../project/view/pages/desktop_projects_page.dart';
import '../bloc/cursor_cubit/cursor_cubit.dart';
import '../bloc/nav_bar_cubit/nav_bar_cubit.dart';
import '../widgets/cursor_widget.dart';
import '../widgets/top_nav_bar.dart';

class IndexPage extends StatelessWidget {
   IndexPage._();
   final ScrollController _scrollController =  ScrollController();


  static Widget create(){
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>injector.get<CursorCubit>()),
        BlocProvider(create: (context)=>injector.get<NavBarCubit>()),
        BlocProvider(create: (_)=>injector.get<ProjectBloc>()),
        BlocProvider(create: (_)=>injector.get<ProjectSliderBloc>())
      ],
      child: IndexPage._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorScheme.surface,
      body: BlocListener<NavBarCubit,NavBarType>(
        listener: (context,state)=>_scrollToPage(context,state ),
        child: BlocBuilder<CursorCubit,Offset>(
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
                      child: SingleChildScrollView(
                        controller: _scrollController,
                        child: Column(
                          children:  [
                            //Home Page
                            ResponsiveLayout(
                               key: context.read<NavBarCubit>().homeKey,
                                mobile:  const MobileHomePage(),
                                tablet:  const MobileHomePage(),
                                desktop:  const DesktopHomePage(),
                            ),
                            //About Page
                            ResponsiveLayout(
                              key: context.read<NavBarCubit>().aboutKey,
                              desktop: const DesktopAboutPage(),
                              mobile: const MobileAboutPage(),
                              tablet: const MobileAboutPage(),
                            ),
                            //Featured Projects Page
                            ResponsiveLayout(
                              key: context.read<NavBarCubit>().projectsKey,
                              desktop: const DesktopProjectsPage(),
                              mobile:  const MobileProjectPage(),
                              tablet:  const MobileProjectPage(),
                            ),

                             //Contact Page
                            ResponsiveLayout(
                                 key: context.read<NavBarCubit>().contactKey,
                              mobile:  const MobileContactPage(),
                              tablet:  const MobileContactPage(),
                              desktop: const DesktopContactPage()
                            )
                          ],
                        ),
                      ),
                    ),

                    /// NavBar
                    const TopNavBar(),

                    /// Page Indicator
                    if(Responsive.isDesktop(context))
                    Positioned(
                        top: 0,
                        bottom: 0,
                        left: 0,
                        child: PageIndicator(scrollController: _scrollController)
                    ),


                    /// Cursor
                    if(Responsive.isDesktop(context))
                    const CursorWidget(),
                  ],
                ),
              ),
            );
          }
        ),
      ),
    );
  }

  void _scrollToPage(BuildContext context,NavBarType type){
    // // Find the RenderBox of the target widget
    // final RenderBox? renderBox = context.read<NavBarCubit>().getNavBarKey(type).currentContext?.findRenderObject() as RenderBox?;
    //
    // if (renderBox != null) {
    //   // Get the position of the target widget relative to the ListView
    //   final position = renderBox.localToGlobal(Offset.zero);
    //
    //   // Get the current scroll position and viewport dimensions
    //   final scrollOffset = _scrollController.offset;
    //
    //   //Calculate the precise scroll position
    //   double targetScrollOffset = position.dy + scrollOffset;
    //
    //   // Animate to the calculated position
    //   _scrollController.animateTo(
    //     targetScrollOffset,
    //     duration: const Duration(milliseconds: 500),
    //     curve: Curves.easeInOut,
    //   );
    // }

  }

}



