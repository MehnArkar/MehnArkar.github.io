import 'package:flutter/cupertino.dart';
import 'package:portfolio/app/utils/responsive/device_screen_type.dart';

class Responsive {
  static double watchWidth = 320;    // For smartwatch devices
  static double mobileWidth = 480;   // For phones
  static double tabletWidth = 768;   // For tablets
  static double desktopWidth = 1024; // For small desktops or large tablets

  static DeviceScreenType  getDeviceScreenType(BuildContext context){
    double screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth <= watchWidth){
      return DeviceScreenType.watch;
    }
    else if (screenWidth <= mobileWidth){
      return DeviceScreenType.mobile;
    }
    else if (screenWidth <= tabletWidth){
      return DeviceScreenType.tablet;
    }
    else{
      return DeviceScreenType.desktop;
    }
  }

  static bool isMobile(BuildContext context){
    return getDeviceScreenType(context) == DeviceScreenType.mobile;
  }

  static bool isTablet(BuildContext context){
    return getDeviceScreenType(context) == DeviceScreenType.tablet;
  }

  static bool isDesktop(BuildContext context){
    return getDeviceScreenType(context) == DeviceScreenType.desktop;
  }

  static bool isWatch(BuildContext context){
    return getDeviceScreenType(context) == DeviceScreenType.watch;
  }

}