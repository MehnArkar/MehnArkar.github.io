import 'package:flutter/material.dart';
import 'package:portfolio/app/config/theme/dimension/app_dimension.dart';
import 'package:portfolio/app/core/presentation/widgets/screen_size_container.dart';
import 'package:portfolio/app/utils/extensions/context_extension.dart';
import 'package:portfolio/features/about/data/repositories/experience_repository.dart';
import 'package:portfolio/features/about/presentation/widgets/about_me_widget.dart';
import 'package:portfolio/features/about/presentation/widgets/education_widget.dart';
import 'package:portfolio/features/about/presentation/widgets/profile_image.dart';
import 'package:portfolio/features/about/presentation/widgets/work_experience_widget.dart';

class MobileAboutPage extends StatelessWidget {
  const MobileAboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: AppDimension.mobilePagePadding,
          vertical: 50
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 50),
          Center(child: ProfileImage(size: context.sh*0.25)),
          const SizedBox(height: 50),
          const AboutMeWidget(),
          const SizedBox(height: 30),
          const EducationWidget(),
          const SizedBox(height: 30),
          WorkExperienceWidget(workExperiences: ExperienceRepository().getWorkExperiences())
        ],
      ),
    );
  }
}
