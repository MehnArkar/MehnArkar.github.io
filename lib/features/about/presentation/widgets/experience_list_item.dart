import 'package:dotted_border/dotted_border.dart';
import 'package:intl/intl.dart';
import 'package:portfolio/app/core/presentation/widgets/visibility_animation_widget.dart';
import 'package:portfolio/app/utils/extensions/context_extension.dart';
import 'package:portfolio/app/utils/extensions/dotted_line_painter.dart';
import 'package:portfolio/features/about/data/model/work_experience.dart';
import 'package:flutter/material.dart';

class ExperienceListItem extends StatelessWidget {
  final WorkExperience workExperience;
  final bool showLine;
  const ExperienceListItem({super.key,required this.workExperience,this.showLine=true});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
         VisibilityAnimationWidget(
             animationType: VisibilityAnimationType.slideLeft,
             child: _indicator(context)),
          const SizedBox(width: 20),
          Expanded(
              child: VisibilityAnimationWidget(
                  animationType: VisibilityAnimationType.slideLeft,
                  child: _context(context))
          )
        ],
      ),
    );
  }


  Widget _indicator(BuildContext context){
    return  Column(
      children: [
        SizedBox(
          height: 25,
          width: 25,
          child: DottedBorder(
              borderType: BorderType.Circle,
              strokeWidth: 0.8,
              dashPattern: const [2],
              padding:const EdgeInsets.all(3),
              color: context.colorScheme.onSurface,
              child: Container(
                decoration: BoxDecoration(
                    color: workExperience.endDate==null? context.colorScheme.primary : context.colorScheme.onSurfaceVariant,
                    shape: BoxShape.circle
                ),
              )
          ),
        ),
        if(showLine)
        Expanded(
          child: CustomPaint(
            painter: DottedLinePainter(color: context.colorScheme.onSurface, strokeWidth: 0.8, dashHeight: 2, gapHeight: 3),
          )
        ),
      ],
    );
  }

  Widget _context(BuildContext context){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: 25,
          child: Align(
            alignment: Alignment.centerLeft,
            child: RichText(
                text: TextSpan(
                    text: workExperience.position,
                    style: context.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w700),
                    children: [
                      TextSpan(
                        text:" @ ${workExperience.companyName}",
                        style: context.textTheme.titleSmall?.copyWith(color: context.colorScheme.primary,fontWeight: FontWeight.w700),
                      )
                    ]
                )
            ),
          ),
        ),
        Row(
          children: [
             Text(DateFormat.yMMM().format(workExperience.startDate),style: context.textTheme.bodyMedium),
            Text(" - ",style: context.textTheme.bodyMedium),
            Text(workExperience.endDate!=null ? DateFormat.yMMM().format(workExperience.endDate!) : "Present",style: context.textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: 15),
        Text(workExperience.description,style: context.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600)),
        const SizedBox(height: 25),
      ],
    );
  }
}
