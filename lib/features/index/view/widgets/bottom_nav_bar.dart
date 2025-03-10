import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/app/config/theme/dimension/app_dimension.dart';
import 'package:portfolio/app/utils/constant/app_constants.dart';
import 'package:portfolio/app/utils/extensions/context_extension.dart';
import 'package:portfolio/features/index/data/models/nab_bar_type.dart';
import 'package:portfolio/features/index/view/bloc/nav_bar_cubit/nav_bar_cubit.dart';

class BottomNavBar extends StatelessWidget {
  final Function(NavBarType navBarType)? onClickNavBar;

  const BottomNavBar({super.key, this.onClickNavBar});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppDimension.borderRadius),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
            width: double.maxFinite,
            height: kToolbarHeight,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: context.colorScheme.primary.withOpacity(0.05),
              borderRadius: BorderRadius.circular(AppDimension.borderRadius),
            ),
            child: BlocBuilder<NavBarCubit, NavBarType>(
                builder: (context, selectedNavBar) => NavigationBarTheme(
                  data: NavigationBarThemeData(
                    labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>(
                          (Set<WidgetState> states) => states.contains(WidgetState.selected)
                          ? context.textTheme.bodySmall!.copyWith(color: context.colorScheme.primary,fontWeight: FontWeight.w600)
                          : context.textTheme.bodySmall!.copyWith(color: context.colorScheme.onSurface)
                    ),
                  ),
                  child: NavigationBar(
                          elevation: 0,
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          indicatorColor: context.colorScheme.primary,
                          selectedIndex: selectedNavBar.index,
                          onDestinationSelected: (index) {
                            NavBarType navBarType = NavBarType.values[index];
                            context.read<NavBarCubit>().onSelectedNavBar(navBarType);
                            if (onClickNavBar != null) onClickNavBar!(navBarType);
                          },
                          destinations: [
                            _navDestination(context, iconName: "home.svg", label: "Home", navBarType: NavBarType.home, selectedNavBar: selectedNavBar),
                            _navDestination(context, iconName: "about.svg", label: "About", navBarType: NavBarType.about, selectedNavBar: selectedNavBar),
                            _navDestination(context, iconName: "projects.svg", label: "Projects", navBarType: NavBarType.projects, selectedNavBar: selectedNavBar),
                            _navDestination(context, iconName: "mail.svg", label: "Contact", navBarType: NavBarType.contact, selectedNavBar: selectedNavBar)
                          ]),
                ))),
      ),
    );
  }

  Widget _navDestination(BuildContext context,{required String iconName,required String label,required NavBarType navBarType,required NavBarType selectedNavBar}){
    return NavigationDestination(
        icon: SvgPicture.asset(
            "${AppConstants.iconPath}/$iconName",
            color: navBarType==selectedNavBar? context.colorScheme.onPrimary : context.colorScheme.onSurface,
            width: 20,
        ),
        label: label
    );
  }

}
