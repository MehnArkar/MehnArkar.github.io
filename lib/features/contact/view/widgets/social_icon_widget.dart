import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../app/utils/constant/app_constants.dart';

class SocialIconWidget extends StatelessWidget {
  final String iconName;
  final Uri uri;
  final double? iconSize;
  const SocialIconWidget({super.key,required this.iconName,required this.uri,this.iconSize});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        borderRadius: BorderRadius.circular(100),
        onTap: ()=>launchUrl(uri),
        child: SvgPicture.asset("${AppConstants.iconPath}/$iconName",width: iconSize,height: iconSize));
  }
}
