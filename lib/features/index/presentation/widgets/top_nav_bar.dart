import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/app/config/theme/dimension/desktop_dimension.dart';
import 'package:portfolio/app/config/theme/dimension/mobile_dimension.dart';
import 'package:portfolio/app/utils/extensions/context_extension.dart';
import 'package:portfolio/features/index/data/nab_bar_type.dart';
import 'package:portfolio/features/index/presentation/widgets/light_dark_icon_widget.dart';
import 'package:portfolio/features/index/presentation/widgets/nav_bar_item.dart';
import '../../../../app/utils/responsive/responsive.dart';
import '../bloc/nav_bar_cubit/nav_bar_cubit.dart';

class TopNavBar extends StatelessWidget {
  const TopNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          width: double.maxFinite,
          height: kToolbarHeight,
          alignment: Alignment.center,
          padding:  const EdgeInsets.symmetric(horizontal:16),
          decoration: BoxDecoration(
              color: context.colorScheme.primary.withOpacity(0.05)),
          child: BlocBuilder<NavBarCubit,NavBarType>(
            builder: (context,selectedNavBar) {
              return Row(
                children: [
                  Text("Arkar.dev",style: context.textTheme.headlineSmall?.copyWith(color: context.colorScheme.primary,fontWeight: FontWeight.bold)),
                  const Spacer(),
                  if(Responsive.isDesktop(context))
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    spacing: 15,
                    children: [
                      NavBarItem(isSelected: selectedNavBar==NavBarType.home, type: NavBarType.home),
                      NavBarItem(isSelected: selectedNavBar==NavBarType.about, type: NavBarType.about),
                      NavBarItem(isSelected: selectedNavBar==NavBarType.projects, type: NavBarType.projects),
                      NavBarItem(isSelected: selectedNavBar==NavBarType.contact, type: NavBarType.contact),
                    ],
                  ),
                  const SizedBox(width: 20),
                  const ThemeIconWidget()

                ],
              );
            }
          )
        ),
      ),
    );
  }
}
