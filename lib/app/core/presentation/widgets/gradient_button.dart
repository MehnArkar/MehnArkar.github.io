import 'package:flutter/material.dart';
import 'package:portfolio/app/config/theme/app_colors.dart';
import 'package:portfolio/app/config/theme/dimension/app_dimension.dart';
import 'package:portfolio/app/utils/extensions/context_extension.dart';

class GradientButton extends StatelessWidget {
  final String label;
  final Widget? icon;
  final Size? fixedSize;
  final void Function()? onPressed;

  const GradientButton({super.key, required this.label, this.icon,this.fixedSize, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppDimension.borderRadius),
      child: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppDimension.borderRadius),
                gradient: onPressed != null ? AppColors.primaryGradient : null,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              fixedSize: fixedSize,
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              foregroundColor: Theme.of(context).colorScheme.onPrimary,
              disabledBackgroundColor: Theme.of(context).colorScheme.onSurface.withOpacity(0.25),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppDimension.borderRadius),
              ),
            ),
            child:Text(label,style: context.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600,color: context.colorScheme.onPrimary))
          ),
        ],
      ),
    );
  }
}