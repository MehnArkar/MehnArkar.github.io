import 'package:flutter/material.dart';
import 'package:portfolio/app/core/presentation/widgets/visibility_animation_widget.dart';
import 'package:portfolio/app/utils/extensions/context_extension.dart';
import 'package:portfolio/features/about/data/model/work_experience.dart';
import 'package:portfolio/features/about/presentation/widgets/experience_list_item.dart';

class WorkExperienceWidget extends StatelessWidget {
  final List<WorkExperience> workExperiences;
  const WorkExperienceWidget({super.key,required this.workExperiences});

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          VisibilityAnimationWidget(
              animationType: VisibilityAnimationType.slideLeft,
              child: Text("Work Experience",style: context.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700,color: context.colorScheme.primary))),
          const SizedBox(height: 10),
          ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: workExperiences.length,
              itemBuilder: (context,index)=>ExperienceListItem(workExperience: workExperiences[index],showLine: index!=workExperiences.length-1)
          )
        ]
    );
  }
}
