import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/app/core/presentation/widgets/screen_size_container.dart';
import 'package:portfolio/app/core/presentation/widgets/visibility_animation_widget.dart';
import 'package:portfolio/app/utils/extensions/context_extension.dart';
import 'package:portfolio/features/home/view/widgets/animated_slide_in_text.dart';
import 'package:portfolio/features/home/view/widgets/next_button.dart';
import 'package:portfolio/features/home/view/widgets/previous_button.dart';
import 'package:portfolio/features/project/data/model/project.dart';
import 'package:portfolio/features/project/view/widgets/about_this_project.dart';
import 'package:portfolio/features/project/view/widgets/appstore_button.dart';
import 'package:portfolio/features/project/view/widgets/desktop_mockup.dart';
import 'package:portfolio/features/project/view/widgets/playstore_button.dart';
import 'package:portfolio/features/project/view/widgets/project_slider_indicator.dart';
import 'package:portfolio/features/project/view_model/project_bloc/project_bloc.dart';
import 'package:portfolio/features/project/view_model/project_slider_bloc/project_slider_bloc.dart';

import '../widgets/projects_page_title.dart';

class DesktopProjectsPage extends StatefulWidget {
  const DesktopProjectsPage({super.key});

  @override
  State<DesktopProjectsPage> createState() => _DesktopProjectsPageState();
}

class _DesktopProjectsPageState extends State<DesktopProjectsPage> {
  int? previousIndex;

  @override
  Widget build(BuildContext context) {
    return ScreenSizeContainer(
        child: Stack(
          alignment: Alignment.topLeft,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: kToolbarHeight),
              child: ProjectsPageTitle(),
            ),
            Center(
              child: Row(
                children: [
                  Expanded(
                      flex: 2,
                      child:
                          Center(child: BlocBuilder<ProjectSliderBloc,int>(
                            builder: (context,index) {
                              return Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  DesktopMockup(height: context.sw * 0.23,animationType: VisibilityAnimationType.fromLeft),
                                  SizedBox(height: (context.sw * 0.23)/10+25),
                                  const ProjectSliderIndicator(dotSize: 8, spacing: 10)
                                ],
                              );
                            }
                          ))),
                  Expanded(
                      flex: 3,
                      child:  VisibilityAnimationWidget(
                          animationType: VisibilityAnimationType.fromRight,
                          child: BlocBuilder<ProjectSliderBloc,int>(
                            builder: (context,projectIndex) {
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
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(height: 50),
                                      const AboutThisProject(width: 60, height: 3),
                                      const SizedBox(height: 15),
                                      AnimatedSlideInText(
                                          text: currentProject.description,
                                          style: context.textTheme.bodyLarge
                                              ?.copyWith(
                                                  fontWeight: FontWeight.w600,
                                                  height: 1.75),
                                          isNext: isNext),
                                      const SizedBox(height: 20),
                                      Row(
                                        children: [
                                          Text("Available on",
                                              style: context.textTheme.bodyMedium
                                                  ?.copyWith(
                                                      fontWeight: FontWeight.w600,
                                                      color: context.colorScheme
                                                          .onSurfaceVariant)),
                                          if (currentProject.playstore != null)
                                            Padding(
                                              padding:
                                                  const EdgeInsets.only(left: 25),
                                              child: PlayStoreButton(
                                                  url: currentProject.playstore!),
                                            ),
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
                                    ],
                                  ),
                                   Row(
                                    children: [
                                      PreviousButton(currentIndex: projectIndex),
                                      const SizedBox(width: 25),
                                      NextButton(currentIndex: projectIndex)
                                    ],
                                  )
                                ],
                              );
                            }
                          )
                      )),
                ],
              ),
            ),
          ],
        ));
  }
}
