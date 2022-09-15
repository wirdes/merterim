import 'package:flutter/material.dart';

enum ViewportHelpers { mobile, desktop }

class ViewportContainer extends StatefulWidget {
  final Widget? child;
  final Widget? mobileChild;
  final Widget? desktopChild;

  static ViewportContainerState of(BuildContext context) =>
      context.findAncestorStateOfType<ViewportContainerState>()!;

  const ViewportContainer({
    Key? key,
    this.child,
    this.mobileChild,
    this.desktopChild,
  }) : super(key: key);

  static ViewportHelpers type(BuildContext context) {
    return MediaQuery.of(context).size.width < 900
        ? ViewportHelpers.mobile
        : ViewportHelpers.desktop;
  }

  @override
  State<ViewportContainer> createState() => ViewportContainerState();
}

class ViewportContainerState extends State<ViewportContainer> {
  ViewportHelpers get type => ViewportContainer.type(context);

  Widget get defaultWidget => widget.child ?? Container();

  @override
  Widget build(BuildContext context) {
    return ViewportContainer.type(context) == ViewportHelpers.mobile
        ? widget.mobileChild ?? defaultWidget
        : widget.desktopChild ?? defaultWidget;
  }
}
