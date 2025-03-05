import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/app/utils/constant/app_constants.dart';
import 'package:portfolio/app/utils/extensions/context_extension.dart';
import 'package:portfolio/features/index/data/models/nab_bar_type.dart';
import 'package:portfolio/features/index/view/bloc/nav_bar_cubit/nav_bar_cubit.dart';

class PageIndicator extends StatefulWidget {
  final ScrollController scrollController;

  const PageIndicator({super.key, required this.scrollController});

  @override
  State<PageIndicator> createState() => _PageIndicatorState();
}

class _PageIndicatorState extends State<PageIndicator> {
  Map<NavBarType, RenderBox?> pageRenderBox = {};

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_){
      _getPagePosition();
    });

    widget.scrollController.addListener(()=>_changeNavBarByPosition());

    super.initState();
  }

  void _changeNavBarByPosition() {
    final navBarCubit = context.read<NavBarCubit>();
    final currentNavBar = navBarCubit.state;
    final scrollOffset = widget.scrollController.offset;

    final candidateNavBar = _determineNavBarForOffset(scrollOffset);

    if (candidateNavBar != null && currentNavBar != candidateNavBar) {
      navBarCubit.onSelectedNavBar(candidateNavBar);
    }
  }

  NavBarType? _determineNavBarForOffset(double offset) {
    // Order matters: check sections from bottom to top
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

  void  _getPagePosition(){
    for (var navBarType in NavBarType.values) {
      final RenderBox? renderBox = context.read<NavBarCubit>().getNavBarKey(navBarType).currentContext?.findRenderObject() as RenderBox?;
      pageRenderBox.addEntries([MapEntry(navBarType, renderBox)]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.sw * 0.1,
      child: Center(
        child: BlocBuilder<NavBarCubit, NavBarType>(
            builder: (context, selectedNavBar) {
          return Column(
            spacing: 30,
            mainAxisSize: MainAxisSize.min,
            children: List.generate(NavBarType.values.length, (index) {
              bool isCurrentSelectedType =
                  NavBarType.values[index] == selectedNavBar;
              return AnimatedContainer(
                  duration: AppConstants.animationDuration,
                  width: 18,
                  height: 18,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                          width: 1.5,
                          color: isCurrentSelectedType
                              ? context.colorScheme.primary
                              : context.colorScheme.onSurfaceVariant),
                      color: isCurrentSelectedType
                          ? context.colorScheme.primary
                          : Colors.transparent));
            }),
          );
        }),
      ),
    );
  }
}
