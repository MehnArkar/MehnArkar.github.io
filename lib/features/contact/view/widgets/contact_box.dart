import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/app/config/theme/app_colors.dart';
import 'package:portfolio/app/config/theme/dimension/app_dimension.dart';
import 'package:portfolio/app/core/presentation/widgets/glow_gradient_border.dart';
import 'package:portfolio/app/core/presentation/widgets/visibility_animation_widget.dart';
import 'package:portfolio/app/utils/constant/app_constants.dart';
import 'package:portfolio/app/utils/extensions/context_extension.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactBox extends StatefulWidget {
  const ContactBox({super.key});

  @override
  State<ContactBox> createState() => _ContactBoxState();
}

class _ContactBoxState extends State<ContactBox> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(vsync: this,duration: AppConstants.animationDuration);
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityAnimationWidget(
      animationType: VisibilityAnimationType.slideUp,
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (context,child) {
          return GlowGradientBorder(
            gradientColors:[AppColors.gradientStartColor,AppColors.gradientEndColor],
            borderRadius: BorderRadius.circular(AppDimension.borderRadius),
            blurRadius: _animationController.value * 3 + 2,
            spreadRadius: _animationController.value * 2 + 1,
            child: InkWell(
              borderRadius: BorderRadius.circular(AppDimension.borderRadius),
              onTap: ()async => await launchUrl(AppConstants.emailLaunchUri),
              onHover: (isHovering){
                if(isHovering){
                  _animationController.forward();
                }else{
                  _animationController.reverse();
                }

              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                decoration: BoxDecoration(
                  color: context.colorScheme.surface,
                  borderRadius: BorderRadius.circular(AppDimension.borderRadius)
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _mailIcon(context),
                    const SizedBox(width: 25),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Reach me at",style: context.textTheme.bodyMedium?.copyWith(color: context.colorScheme.onSurfaceVariant,fontWeight: FontWeight.w700)),
                        Text(AppConstants.emailLaunchUri.path.toString(),style: context.textTheme.bodyLarge?.copyWith(color: context.colorScheme.primary,fontWeight: FontWeight.w700)),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        }
      ),
    );
  }

  Widget _mailIcon(BuildContext context){
    return Container(
      width: 40,
      height: 40,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: context.colorScheme.primary.withOpacity(0.25),
          borderRadius: BorderRadius.circular(AppDimension.borderRadius)
      ),
      child: SvgPicture.asset("${AppConstants.iconPath}/mail.svg",color: context.colorScheme.primary,width: 30,height: 30),

    );
  }
}
