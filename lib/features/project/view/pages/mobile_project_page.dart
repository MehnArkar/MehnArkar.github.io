import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/app/config/theme/dimension/app_dimension.dart';
import 'package:portfolio/app/core/presentation/widgets/visibility_animation_widget.dart';
import 'package:portfolio/app/utils/extensions/context_extension.dart';
import 'package:portfolio/features/project/view/widgets/about_this_project.dart';
import 'package:portfolio/features/project/view/widgets/project_mockup.dart';
import 'package:portfolio/features/project/view/widgets/projects_page_title.dart';
import 'package:portfolio/features/project/view_model/project_slider_bloc/project_slider_bloc.dart';
import '../../../home/view/widgets/animated_slide_in_text.dart';
import '../../../home/view/widgets/next_button.dart';
import '../../../home/view/widgets/previous_button.dart';
import '../../data/model/project.dart';
import '../../view_model/project_bloc/project_bloc.dart';
import '../widgets/appstore_button.dart';
import '../widgets/playstore_button.dart';

class MobileProjectPage extends StatefulWidget {
   const MobileProjectPage({super.key});

  @override
  State<MobileProjectPage> createState() => _MobileProjectPageState();
}

class _MobileProjectPageState extends State<MobileProjectPage> {
  int? previousIndex;

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppDimension.mobilePagePadding,vertical: 50),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Align(
              alignment: Alignment.centerLeft,
              child: ProjectsPageTitle()),
          const SizedBox(height: 50),
          ProjectMockup(height: context.sh*0.25),
          const SizedBox(height: 20),
          VisibilityAnimationWidget(
              animationType: VisibilityAnimationType.slideIn,
              child: BlocBuilder<ProjectSliderBloc,int>(
                  builder: (context,projectIndex){
                    bool isNext = previousIndex == null || projectIndex > previousIndex!;
                    previousIndex = projectIndex; // Update previous index
                    Project currentProject = context.read<ProjectBloc>().state[projectIndex];
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AnimatedSlideInText(
                            text: currentProject.name,
                            style: context.textTheme.titleLarge?.copyWith(
                                fontWeight: FontWeight.w700,
                                color: context.colorScheme.primary),
                            isNext: isNext),
                        const SizedBox(height: 20),
                        const AboutThisProject(width: 60, height: 3),
                        const SizedBox(height: 20),
                        AnimatedSlideInText(
                            text: currentProject.description,
                            style: context.textTheme.bodyLarge
                                ?.copyWith(
                                fontWeight: FontWeight.w600,
                                height: 1.75),
                            isNext: isNext),
                        const SizedBox(height: 20),
                        // Text("Available on - ",
                        //     style: context.textTheme.bodyMedium
                        //         ?.copyWith(
                        //         fontWeight: FontWeight.w600,
                        //         color: context.colorScheme
                        //             .onSurfaceVariant)),
                        // const SizedBox(height: 10),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            if (currentProject.playstore != null)
                              PlayStoreButton(
                                  url: currentProject.playstore!),
                            if (currentProject.appstore != null)
                              Padding(
                                padding:
                                const EdgeInsets.only(left: 25),
                                child: AppStoreButton(
                                    url: currentProject.appstore!),
                              )
                          ],
                        ),
                        const SizedBox(height: 50),
                          Center(
                          child:  Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              PreviousButton(currentIndex: projectIndex),
                              const SizedBox(width: 25),
                              NextButton(currentIndex: projectIndex)
                            ],
                          ),
                        )

                      ],
                    );
                  }
              ),
          )
        ],
      ),
    );
  }
}
