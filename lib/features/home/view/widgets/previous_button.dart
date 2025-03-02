import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/app/config/theme/dimension/app_dimension.dart';
import 'package:portfolio/app/utils/extensions/context_extension.dart';
import 'package:portfolio/features/project/view_model/project_slider_bloc/project_slider_bloc.dart';

class PreviousButton extends StatelessWidget {
  const PreviousButton({super.key});

  @override
  Widget build(BuildContext context) {
    ProjectSliderBloc projectSliderBloc = context.read<ProjectSliderBloc>();
    return OutlinedButton(
        onPressed: projectSliderBloc.state > 0
            ? () {
                if (projectSliderBloc.state > 0) {
                  projectSliderBloc.onChangeIndex(projectSliderBloc.state - 1);
                }
              }
            : null,
        style: OutlinedButton.styleFrom(
            fixedSize: const Size(120, AppDimension.buttonHeight),
            side: BorderSide(color: context.colorScheme.primary),
            shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(AppDimension.borderRadius))),
        child: Text("Previous",
            style: context.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w600,
                color: context.colorScheme.primary)));
  }
}
