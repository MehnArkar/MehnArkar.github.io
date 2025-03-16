import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/app/core/presentation/widgets/visibility_animation_widget.dart';
import 'package:portfolio/app/utils/constant/app_constants.dart';
import 'package:portfolio/features/project/data/model/project.dart';
import 'package:portfolio/features/project/view/widgets/animated_mockup.dart';
import 'package:portfolio/features/project/view_model/project_bloc/project_bloc.dart';
import 'package:portfolio/features/project/view_model/project_slider_bloc/project_slider_bloc.dart';
import 'package:visibility_detector/visibility_detector.dart';

class DesktopMockup extends StatefulWidget {
  final double height;
  final VisibilityAnimationType? animationType;
  const DesktopMockup({super.key, required this.height, this.animationType});

  @override
  State<DesktopMockup> createState() => _DesktopMockupState();
}

class _DesktopMockupState extends State<DesktopMockup>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(vsync: this, duration: AppConstants.animationDuration);
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: UniqueKey(),
      onVisibilityChanged: (visibilityInfo) {
        if (visibilityInfo.visibleFraction >= 1.0) {
          _animationController.forward();
        }
      },
      child: BlocListener<ProjectSliderBloc, int>(
        listener: (context, state) {
          _animationController.reset();
          _animationController.forward();
        },
        child: VisibilityAnimationWidget(
          animationType: widget.animationType,
          child: BlocBuilder<ProjectSliderBloc, int>(
              builder: (context, currentIndex) {
            Project currentProject =
                context.read<ProjectBloc>().state[currentIndex];
            return AnimatedMockup(
                height: widget.height,
                animationController: _animationController,
                images: currentProject.images);
          }),
        ),
      ),
    );
  }
}
