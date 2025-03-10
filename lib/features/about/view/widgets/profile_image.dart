import 'package:flutter/material.dart';
import 'package:portfolio/app/utils/constant/app_constants.dart';
import 'package:portfolio/app/utils/extensions/context_extension.dart';
import 'package:visibility_detector/visibility_detector.dart';

import 'hole_clipper.dart';

class ProfileImage extends StatefulWidget {
  final double size;
  const ProfileImage({super.key,required this.size});

  @override
  State<ProfileImage> createState() => _ProfileImageState();
}

class _ProfileImageState extends State<ProfileImage> with SingleTickerProviderStateMixin{
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 700));
  }


  @override
  Widget build(BuildContext context) {
   return Stack(
     children: [
       Container(
          width: widget.size,
          height: widget.size,
          decoration:  BoxDecoration(
            color: context.colorScheme.primary,
            shape: BoxShape.circle,
            image: const DecorationImage(
              image: AssetImage("${AppConstants.imagePath}/profile.png"),
              fit: BoxFit.cover
            )
          ),
       ),

       VisibilityDetector(
         key: UniqueKey(),
         onVisibilityChanged: (visibilityInfo){
            var visiblePercentage = visibilityInfo.visibleFraction;
            if(visiblePercentage>=1){
              animationController.forward();
            }
         },
         child: AnimatedBuilder(
           animation: animationController,
           builder: (context, _) => ClipPath(
               clipper: HoleClipper(holeSize: widget.size * animationController.value),
               child: Container(
                 width: widget.size,
                 height: widget.size,
                 color: context.colorScheme.surface,
               )),
         ),
       )
     ],
   );
  }
}
