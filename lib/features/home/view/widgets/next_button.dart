import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/app/config/theme/dimension/app_dimension.dart';
import 'package:portfolio/app/utils/extensions/context_extension.dart';
import 'package:portfolio/features/project/view_model/project_slider_bloc/project_slider_bloc.dart';

import '../../../project/view_model/project_bloc/project_bloc.dart';

class NextButton extends StatelessWidget {
  const NextButton({super.key});

  @override
  Widget build(BuildContext context) {
    ProjectSliderBloc projectSliderBloc = context.read<ProjectSliderBloc>();
    ProjectBloc projectBloc = context.read<ProjectBloc>();
    return ElevatedButton(
        onPressed:projectSliderBloc.state < projectBloc.state.length - 1
            ? (){
          if(projectSliderBloc.state < projectBloc.state.length - 1) {
            projectSliderBloc.onChangeIndex(projectSliderBloc.state + 1);
          }
        }
        :null,
        style: ElevatedButton.styleFrom(
          fixedSize: const Size(120, AppDimension.buttonHeight)
        ),
        child: Text("Next",style: context.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600,color: context.colorScheme.onPrimary))
    );
  }
}
