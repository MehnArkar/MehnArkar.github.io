import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/app/utils/constant/app_constants.dart';
import 'package:portfolio/app/utils/extensions/context_extension.dart';
import 'package:portfolio/features/project/view_model/project_bloc/project_bloc.dart';
import 'package:portfolio/features/project/view_model/project_slider_bloc/project_slider_bloc.dart';

class ProjectSliderIndicator extends StatelessWidget {
  final double dotSize;
  final double spacing;
  const ProjectSliderIndicator({super.key,required this.dotSize,required this.spacing});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProjectSliderBloc, int>(
        builder: (context, selectedIndex) => Row(
              mainAxisSize: MainAxisSize.min,
              spacing: spacing,
              children: List.generate(context.read<ProjectBloc>().state.length,
                  (index) {
                bool isSelectedIndex = selectedIndex == index;
                return AnimatedContainer(
                    duration: AppConstants.animationDuration,
                    width: dotSize,
                    height: dotSize,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            width: 1,
                            color: isSelectedIndex
                                ? context.colorScheme.primary
                                : context.colorScheme.onSurfaceVariant),
                        color: isSelectedIndex
                            ? context.colorScheme.primary
                            : Colors.transparent));
              }),
            ));
  }
}
