import 'package:flutter/material.dart';

enum DeviceScreenType { mobile, desktop }

class ViewContainer extends StatefulWidget {
  final Widget mobile;
  final Widget desktop;
  const ViewContainer({super.key, required this.mobile, required this.desktop});

  @override
  State<ViewContainer> createState() => ViewContainerState();

  static DeviceScreenType getDeviceType(MediaQueryData mediaQuery) {
    double deviceWidth = mediaQuery.size.width;
    if (deviceWidth > 800) {
      return DeviceScreenType.desktop;
    }
    return DeviceScreenType.mobile;
  }
}

class ViewContainerState extends State<ViewContainer> {
  @override
  Widget build(BuildContext context) {
    final DeviceScreenType type = MediaQuery.of(context).size.width > 800
        ? DeviceScreenType.desktop
        : DeviceScreenType.mobile;
    return type == DeviceScreenType.mobile ? widget.mobile : widget.desktop;
  }
}
