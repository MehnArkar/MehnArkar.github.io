import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/app/config/theme/app_colors.dart';
import 'package:portfolio/app/core/presentation/widgets/visibility_animation_widget.dart';
import 'package:portfolio/app/utils/constant/app_constants.dart';
import 'package:portfolio/app/utils/extensions/context_extension.dart';
import 'package:portfolio/features/project/data/model/project.dart';
import 'package:portfolio/features/project/view_model/project_bloc/project_bloc.dart';
import 'package:portfolio/features/project/view_model/project_slider_bloc/project_slider_bloc.dart';
import 'package:visibility_detector/visibility_detector.dart';

class ProjectMockup extends StatefulWidget {
 final double height ;
  const ProjectMockup({super.key,required this.height});

  @override
  State<ProjectMockup> createState() => _ProjectMockupState();
}

class _ProjectMockupState extends State<ProjectMockup> with SingleTickerProviderStateMixin{
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(vsync: this,duration: AppConstants.animationDuration);
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: UniqueKey(),
      onVisibilityChanged: (visibilityInfo){
        if(visibilityInfo.visibleFraction >= 1.0){
          _animationController.forward();
        }
      },
      child: BlocListener<ProjectSliderBloc,int>(
        listener: (context,state){
          _animationController.reset();
          _animationController.forward();
        },
        child: VisibilityAnimationWidget(
          animationType: VisibilityAnimationType.fromLeft,
          child: BlocBuilder<ProjectSliderBloc,int>(
            builder: (context,currentIndex) {
              Project currentProject = context.read<ProjectBloc>().state[currentIndex];
              return SizedBox(
                height: widget.height,
                child: Stack(
                  alignment: Alignment.center,
                  children: [

                   Transform.translate(
                     offset: Offset(0, widget.height/10),
                     child: Stack(
                       fit: StackFit.loose,
                       alignment: Alignment.center,
                       children: [
                         AnimatedBuilder(
                           animation: _animationController,
                           builder: (context,_)=> Container(
                             width: _animationController.value * widget.height,
                             height: _animationController.value * widget.height,
                             margin: const EdgeInsets.all(20),
                             decoration: BoxDecoration(
                               gradient: LinearGradient(colors: [
                                 AppColors.gradientStartColor,
                                 AppColors.gradientEndColor
                               ]),
                               shape: BoxShape.circle,
                             ),

                           ),
                         ),
                         ClipRRect(
                           child: BackdropFilter(
                             filter: ImageFilter.blur(sigmaY: 10,sigmaX: 10),
                             child: Container(color: context.colorScheme.surface.withOpacity(0.1)),
                           ),
                         ),
                       ],
                     ),
                   ),

                    Animate(
                      controller: _animationController,
                      autoPlay: false,
                      effects: [
                        const MoveEffect(begin:  Offset(0, 0),end: Offset(0, 0)),
                        RotateEffect(begin: d2r(0), end: d2r(1.5), duration: 800.ms,alignment: Alignment.bottomRight)
                      ],
                      child: Image.asset(
                        currentProject.images.first,
                        height: widget.height,
                        fit: BoxFit.cover,
                      )
                    ),

                    Animate(
                      controller: _animationController,
                      autoPlay: false,
                      effects: [
                        const MoveEffect(begin:  Offset(0, 0),end: Offset(0, 0)),
                        RotateEffect(begin: d2r(0), end: d2r(-1.5), duration: 800.ms,alignment: Alignment.bottomLeft)
                      ],
                      child: Image.asset(
                        currentProject.images.last,
                        height: widget.height,
                        fit: BoxFit.cover,
                      )
                    ),


                  ],
                ),
              );
            }
          ),
        ),
      ),
    );
  }

 double d2r(double d){
   double r =(d*pi)/180;
   return r;
 }
}

extension on num {
  double get degrees => this * (3.141592653589793 / 180);
}

