// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:portfolio/app/config/theme/dimension/app_dimension.dart';
// import 'package:portfolio/app/core/presentation/widgets/visibility_animation_widget.dart';
// import 'package:portfolio/app/utils/extensions/context_extension.dart';
// import 'package:portfolio/features/project/view/widgets/about_this_project.dart';
// import 'package:portfolio/features/project/view/widgets/project_mockup.dart';
// import 'package:portfolio/features/project/view/widgets/projects_page_title.dart';
// import 'package:portfolio/features/project/view_model/project_slider_bloc/project_slider_bloc.dart';
// import '../../../home/view/widgets/animated_slide_in_text.dart';
// import '../../../home/view/widgets/next_button.dart';
// import '../../../home/view/widgets/previous_button.dart';
// import '../../data/model/project.dart';
// import '../../view_model/project_bloc/project_bloc.dart';
// import '../widgets/appstore_button.dart';
// import '../widgets/playstore_button.dart';
//
// class MobileProjectPage extends StatefulWidget {
//    const MobileProjectPage({super.key});
//
//   @override
//   State<MobileProjectPage> createState() => _MobileProjectPageState();
// }
//
// class _MobileProjectPageState extends State<MobileProjectPage> {
//   int? previousIndex;
//
//   @override
//   Widget build(BuildContext context) {
//     return  Padding(
//       padding: const EdgeInsets.symmetric(horizontal: AppDimension.mobilePagePadding,vertical: 50),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           const Align(
//               alignment: Alignment.centerLeft,
//               child: ProjectsPageTitle()),
//           const SizedBox(height: 50),
//           ProjectMockup(height: context.sh*0.25),
//           const SizedBox(height: 20),
//           VisibilityAnimationWidget(
//               animationType: VisibilityAnimationType.fromRight,
//               child: BlocBuilder<ProjectSliderBloc,int>(
//                   builder: (context,projectIndex){
//                     bool isNext = previousIndex == null || projectIndex > previousIndex!;
//                     previousIndex = projectIndex; // Update previous index
//                     Project currentProject = context.read<ProjectBloc>().state[projectIndex];
//                     return Column(
//                       mainAxisSize: MainAxisSize.min,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         AnimatedSlideInText(
//                             text: currentProject.name,
//                             style: context.textTheme.titleLarge?.copyWith(
//                                 fontWeight: FontWeight.w700,
//                                 color: context.colorScheme.primary),
//                             isNext: isNext),
//                         const SizedBox(height: 20),
//                         const AboutThisProject(width: 60, height: 3),
//                         const SizedBox(height: 20),
//                         AnimatedSlideInText(
//                             text: currentProject.description,
//                             style: context.textTheme.bodyLarge
//                                 ?.copyWith(
//                                 fontWeight: FontWeight.w600,
//                                 height: 1.75),
//                             isNext: isNext),
//                         const SizedBox(height: 20),
//                         // Text("Available on - ",
//                         //     style: context.textTheme.bodyMedium
//                         //         ?.copyWith(
//                         //         fontWeight: FontWeight.w600,
//                         //         color: context.colorScheme
//                         //             .onSurfaceVariant)),
//                         // const SizedBox(height: 10),
//                         Row(
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             if (currentProject.playstore != null)
//                               PlayStoreButton(
//                                   url: currentProject.playstore!),
//                             if (currentProject.appstore != null)
//                               Padding(
//                                 padding:
//                                 const EdgeInsets.only(left: 25),
//                                 child: AppStoreButton(
//                                     url: currentProject.appstore!),
//                               )
//                           ],
//                         ),
//                         const SizedBox(height: 50),
//                           Center(
//                           child:  Row(
//                             mainAxisSize: MainAxisSize.min,
//                             children: [
//                               PreviousButton(currentIndex: projectIndex),
//                               const SizedBox(width: 25),
//                               NextButton(currentIndex: projectIndex)
//                             ],
//                           ),
//                         )
//
//                       ],
//                     );
//                   }
//               ),
//           )
//         ],
//       ),
//     );
//   }
// }

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/app/config/theme/app_colors.dart';
import 'package:portfolio/app/config/theme/dimension/app_dimension.dart';
import 'package:portfolio/app/core/presentation/widgets/glow_gradient_border.dart';
import 'package:portfolio/app/core/presentation/widgets/visibility_animation_widget.dart';
import 'package:portfolio/app/utils/constant/app_constants.dart';
import 'package:portfolio/app/utils/extensions/context_extension.dart';
import 'package:portfolio/features/project/data/model/project.dart';
import 'package:portfolio/features/project/view/widgets/appstore_button.dart';
import 'package:portfolio/features/project/view/widgets/playstore_button.dart';
import 'package:portfolio/features/project/view/widgets/projects_page_title.dart';
import 'package:portfolio/features/project/view_model/project_bloc/project_bloc.dart';
import '../widgets/project_mockup.dart';

class MobileProjectPage extends StatelessWidget {
  const MobileProjectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 50),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Align(
            alignment: Alignment.centerLeft,
            child: ProjectsPageTitle(),
          ),
          const SizedBox(height: 50),
          CarouselSlider(
              options: CarouselOptions(
                  height: context.sh * 0.75,
                  viewportFraction: 0.8,
                  enlargeCenterPage: true),
              items: context
                  .read<ProjectBloc>()
                  .state
                  .map((project) => _projectCard(context, project))
                  .toList())
        ],
      ),
    );
  }

  Widget _projectCard(BuildContext context, Project project) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: GlowGradientBorder(
        gradientColors: [
          AppColors.gradientStartColor,
          AppColors.gradientEndColor
        ],
        borderRadius: BorderRadius.circular(
            AppDimension.borderRadius + AppDimension.borderRadius),
        blurRadius: 1.5,
        spreadRadius: 1.5,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              VisibilityAnimationWidget(
                  effects: _slideUpEffect,
                  child:
                      Center(child: ProjectMockup(height: context.sh * 0.18))),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: double.maxFinite,
                    child: Text(project.name,
                        style: context.textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.w700,
                            color: context.colorScheme.primary)),
                  ),
                  SizedBox(height: context.sh*0.01),
                  Text(
                    project.description,
                    style: context.textTheme.bodyLarge
                        ?.copyWith(fontWeight: FontWeight.w600, height: 1.75),
                  ),
                ],
              ),
              VisibilityAnimationWidget(
                effects: _slideUpEffect,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    if (project.playstore != null)
                      PlayStoreButton(url: project.playstore!),
                    if (project.appstore != null)
                      AppStoreButton(url: project.appstore!)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  final List<Effect> _slideUpEffect = const [
    SlideEffect(
        duration: AppConstants.animationDuration,
        begin: Offset(0, 0.3),
        end: Offset(0.0, 0.0)),
    FadeEffect(duration: AppConstants.animationDuration, begin: 0, end: 1)
  ];
}
