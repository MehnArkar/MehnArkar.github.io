import 'package:flutter/material.dart';
import 'package:portfolio/app/utils/responsive/device_screen_type.dart';
import 'package:portfolio/app/utils/responsive/responsive.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget? mobile;
  final Widget? tablet;
  final Widget? desktop;
  final Widget? watch;
  const ResponsiveLayout({super.key,this.mobile,this.tablet,this.desktop,this.watch});

  @override
  Widget build(BuildContext context) {
    DeviceScreenType deviceScreenType = Responsive.getDeviceScreenType(context);
    return Container(
        child: switch(deviceScreenType) {
          DeviceScreenType.mobile => mobile,
          DeviceScreenType.tablet => tablet,
          DeviceScreenType.desktop => desktop,
          DeviceScreenType.watch => watch,
        }
    );
  }
}
