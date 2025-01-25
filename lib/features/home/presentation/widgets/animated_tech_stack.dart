import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/app/utils/constant/app_constants.dart';

class AnimatedTechStack extends StatelessWidget {
  final double? iconSize;
  const AnimatedTechStack({super.key, this.iconSize});

  final List<String> techStackIcons = const ["flutter.svg","dart.svg","swift.svg","kotlin.svg"];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: List.generate(techStackIcons.length, (index)=>Animate(
          effects: [
            SlideEffect(
                begin: const Offset(0, 0),
                end: Offset(index.toDouble()*2, 0),
                duration: const Duration(milliseconds: 800),
                delay: const Duration(milliseconds: 500)
            ),
            FadeEffect(
              begin: 0,
              end: 1,
              delay:  Duration(milliseconds: 200*(index+1))
            )
          ],
          child: SvgPicture.asset("${AppConstants.iconPath}/${techStackIcons[index]}",width: iconSize ?? 30,height: iconSize ?? 30)
      )
      )
    );
  }
}
