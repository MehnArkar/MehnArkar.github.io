import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/app/utils/extensions/context_extension.dart';
import '../../../../app/utils/constant/app_constants.dart';
import '../../data/models/nab_bar_type.dart';
import '../bloc/nav_bar_cubit/nav_bar_cubit.dart';

class PageIndicator extends StatelessWidget {
  const PageIndicator({super.key});

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
