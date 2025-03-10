import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/app/config/theme/dimension/app_dimension.dart';
import 'package:portfolio/app/utils/extensions/context_extension.dart';
import 'package:portfolio/app/utils/responsive/responsive.dart';
import 'package:portfolio/app/utils/responsive/responsive_layout.dart';
import 'package:portfolio/features/contact/view/pages/desktop_contact_page.dart';
import 'package:portfolio/features/contact/view/pages/mobile_contact_page.dart';
import 'package:portfolio/features/index/data/models/nab_bar_type.dart';
import 'package:portfolio/features/index/view/widgets/bottom_nav_bar.dart';
import 'package:portfolio/features/index/view/widgets/page_indicator.dart';
import 'package:portfolio/features/index/view/widgets/social_media_overlay.dart';
import 'package:portfolio/features/project/view/pages/mobile_project_page.dart';
import 'package:portfolio/features/project/view_model/project_bloc/project_bloc.dart';
import 'package:portfolio/features/project/view_model/project_slider_bloc/project_slider_bloc.dart';
import '../../../../app/utils/constant/app_constants.dart';
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

class IndexPage extends StatefulWidget {
  const IndexPage._();

  static Widget create() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => injector.get<CursorCubit>()),
        BlocProvider(create: (context) => injector.get<NavBarCubit>()),
        BlocProvider(create: (_) => injector.get<ProjectBloc>()),
        BlocProvider(create: (_) => injector.get<ProjectSliderBloc>()),
      ],
      child: const IndexPage._(),
    );
  }

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> with WidgetsBindingObserver {
  final ScrollController _scrollController = ScrollController();
  Map<NavBarType, RenderBox?> pageRenderBox = {};

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback((_) {
        _getPagePosition();
        _initializeScrollListener();
    });
  }

  @override
  void didChangeMetrics() {
    super.didChangeMetrics();
    WidgetsBinding.instance.addPostFrameCallback((_) {
        _getPagePosition();
        _initializeScrollListener();
    });
  }

  @override
  void dispose() {
    _scrollController.removeListener(_changeNavBarByPosition);
    _scrollController.dispose(); // Add proper disposal
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorScheme.surface,
      body: BlocBuilder<CursorCubit, Offset>(
        builder: (context, state) {
          return MouseRegion(
            onHover: (event) =>
                context.read<CursorCubit>().onCursorChange(event.position),
            child: SizedBox(
              width: double.maxFinite,
              height: context.sh,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  SizedBox(
                    width: double.maxFinite,
                    height: context.sh,
                    child: SingleChildScrollView(
                      controller: _scrollController,
                      child: Column(
                        children: [
                          ResponsiveLayout(
                            key: context.read<NavBarCubit>().homeKey,
                            mobile: const MobileHomePage(),
                            tablet: const MobileHomePage(),
                            desktop: const DesktopHomePage(),
                          ),
                          ResponsiveLayout(
                            key: context.read<NavBarCubit>().aboutKey,
                            desktop: const DesktopAboutPage(),
                            mobile: const MobileAboutPage(),
                            tablet: const MobileAboutPage(),
                          ),
                          ResponsiveLayout(
                            key: context.read<NavBarCubit>().projectsKey,
                            desktop: const DesktopProjectsPage(),
                            mobile: const MobileProjectPage(),
                            tablet: const MobileProjectPage(),
                          ),
                          ResponsiveLayout(
                            key: context.read<NavBarCubit>().contactKey,
                            mobile: const MobileContactPage(),
                            tablet: const MobileContactPage(),
                            desktop: const DesktopContactPage(),
                          ),
                        ],
                      ),
                    ),
                  ),
                  TopNavBar(
                      onClickNavBar: (navBarType) =>
                          _scrollToPageOnNavBarChange(context, navBarType)),
                  if (Responsive.isDesktop(context))
                    const Positioned(
                      top: 0,
                      bottom: 0,
                      left: 0,
                      child: PageIndicator(),
                    ),
                  if (Responsive.isDesktop(context))
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child: SocialMediaOverlay(
                            scrollController: _scrollController)),
                  if (!Responsive.isDesktop(context))
                    Positioned(left: AppDimension.mobilePagePadding, right: AppDimension.mobilePagePadding, bottom: 25 , child: BottomNavBar(onClickNavBar: (navBarType) =>
                          _scrollToPageOnNavBarChange(context, navBarType))),
                  if (Responsive.isDesktop(context)) const CursorWidget(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _initializeScrollListener() {
    _scrollController.addListener(_changeNavBarByPosition);
  }

  Future<void> _scrollToPageOnNavBarChange(
      BuildContext context, NavBarType type) async {
    NavBarCubit navBarCubit = context.read<NavBarCubit>();
    final RenderBox? renderBox = navBarCubit
        .getNavBarKey(type)
        .currentContext
        ?.findRenderObject() as RenderBox?;

    if (renderBox != null) {
      final position = renderBox.localToGlobal(Offset.zero);
      final scrollOffset = _scrollController.offset;
      double targetScrollOffset = position.dy + scrollOffset;

      navBarCubit.shouldListenScrollView = false;
      await _scrollController.animateTo(
        targetScrollOffset,
        duration: AppConstants.animationDuration,
        curve: Curves.easeInOut,
      );
      navBarCubit.shouldListenScrollView = true;
    }
  }

  void _changeNavBarByPosition() {
    if (context.read<NavBarCubit>().shouldListenScrollView) {
      final navBarCubit = context.read<NavBarCubit>();
      final currentNavBar = navBarCubit.state;
      final scrollOffset = _scrollController.offset;

      final candidateNavBar = _determineNavBarForOffset(scrollOffset);
      if (candidateNavBar != null && currentNavBar != candidateNavBar) {
        navBarCubit.onSelectedNavBar(candidateNavBar);
      }
    }
  }

  NavBarType? _determineNavBarForOffset(double offset) {
    final navBarPriority = [
      NavBarType.contact,
      NavBarType.projects,
      NavBarType.about,
      NavBarType.home,
    ];

    for (final navType in navBarPriority) {
      if (_isOffsetInSection(offset, navType)) {
        return navType;
      }
    }
    return null;
  }

  bool _isOffsetInSection(double offset, NavBarType navType) {
    final renderBox = pageRenderBox[navType]!;
    final sectionPosition = renderBox.localToGlobal(Offset.zero).dy + offset;
    final sectionThreshold = sectionPosition - renderBox.size.height * 0.5;
    return offset > sectionThreshold;
  }

  void _getPagePosition() {
    for (var navBarType in NavBarType.values) {
      final RenderBox? renderBox = context
          .read<NavBarCubit>()
          .getNavBarKey(navBarType)
          .currentContext
          ?.findRenderObject() as RenderBox?;
      pageRenderBox[navBarType] = renderBox;
    }
  }
}
