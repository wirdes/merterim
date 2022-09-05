import 'package:flutter/material.dart';

enum Viewport { mobile, desktop }

class ViewportContainer extends StatefulWidget {
  final Widget? child;
  final Widget? mobileChild;
  final Widget? desktopChild;

  const ViewportContainer({
    Key? key,
    this.child,
    this.mobileChild,
    this.desktopChild,
  }) : super(key: key);

  static Viewport type(BuildContext context) {
    return MediaQuery.of(context).size.width < 900
        ? Viewport.mobile
        : Viewport.desktop;
  }

  @override
  State<ViewportContainer> createState() => _ViewportContainerState();
}

class _ViewportContainerState extends State<ViewportContainer> {
  Viewport get type => ViewportContainer.type(context);

  Widget get defaultWidget => widget.child ?? Container();

  @override
  Widget build(BuildContext context) {
    return ViewportContainer.type(context) == Viewport.mobile
        ? widget.mobileChild ?? defaultWidget
        : widget.desktopChild ?? defaultWidget;
  }
}
