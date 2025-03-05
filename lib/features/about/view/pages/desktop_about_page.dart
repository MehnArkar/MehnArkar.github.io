import 'package:flutter/material.dart';
import 'package:portfolio/app/core/presentation/widgets/screen_size_container.dart';
import 'package:portfolio/features/about/data/repositories/experience_repository.dart';
import 'package:portfolio/features/about/view/widgets/about_page_title.dart';

import '../widgets/about_me_widget.dart';
import '../widgets/education_widget.dart';
import '../widgets/profile_image.dart';
import '../widgets/work_experience_widget.dart';

class DesktopAboutPage extends StatelessWidget {
  const DesktopAboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenSizeContainer(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const  AboutPageTitle(),
            const SizedBox(height: 30),
            Row(
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
          ],
        ),
      ),
    );
  }

}
