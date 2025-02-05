import 'package:flutter/material.dart';
import 'package:portfolio/app/config/theme/dimension/app_dimension.dart';
import 'package:portfolio/app/utils/extensions/context_extension.dart';
import 'package:portfolio/app/utils/responsive/responsive.dart';

class ScreenSizeContainer extends StatelessWidget {
  final Widget? child;
  const ScreenSizeContainer({super.key,this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: context.sh,
      padding:Responsive.isDesktop(context)
          ?   EdgeInsets.symmetric(horizontal: context.sw*0.1)
          :   const EdgeInsets.symmetric(horizontal: AppDimension.mobilePagePadding),
      child: child,
    );
  }
}
