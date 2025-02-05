import 'package:flutter/material.dart';
import 'package:portfolio/app/core/presentation/widgets/screen_size_container.dart';
import 'package:portfolio/features/about/data/repositories/experience_repository.dart';
import 'package:portfolio/features/about/presentation/widgets/about_me_widget.dart';
import 'package:portfolio/features/about/presentation/widgets/education_widget.dart';
import 'package:portfolio/features/about/presentation/widgets/profile_image.dart';
import 'package:portfolio/features/about/presentation/widgets/work_experience_widget.dart';

class DesktopAboutPage extends StatelessWidget {
  const DesktopAboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenSizeContainer(
      child: Row(
        children: [
          const Flexible(
               flex: 2,
               child: Center(child: ProfileImage(size: 250))
           ),
          Flexible(
              flex: 3,
              child: Column(
                spacing: 20,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const AboutMeWidget(),
                  const EducationWidget(),
                  WorkExperienceWidget(workExperiences: ExperienceRepository().getWorkExperiences())
                ],
              )
          )
        ],
      ),
    );
  }

}
