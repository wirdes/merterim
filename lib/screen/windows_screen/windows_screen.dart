import 'package:flutter/material.dart';
import 'package:mert_erim_web/models/theme.dart';
import 'package:mert_erim_web/screen/components/desktop_element.dart';
import 'package:mert_erim_web/screen/components/explorer.dart';
import 'package:mert_erim_web/screen/components/start.dart';
import 'package:mert_erim_web/screen/components/taskbar.dart';
import 'package:provider/provider.dart';

enum ResizePosition {
  topLeft,
  topRight,
  bottomLeft,
  bottomRight,
  left,
  right,
  top,
  bottom,
  none
}

class WindowsScreen extends StatefulWidget {
  final Widget child;
  const WindowsScreen({super.key, required this.child});

  @override
  State<WindowsScreen> createState() => _WindowsScreenState();
}

class _WindowsScreenState extends State<WindowsScreen> {
  bool _isStartUpMenuOpen = false;
  bool _isWindowsElements = false;
  bool _isResizing = false;
  bool _isMoving = false;
  ResizePosition _resizePosition = ResizePosition.bottomRight;
  String? windowsElementTitle;
  ImageProvider? windowsElementImage;
  double _x = 40;
  double _y = 40;
  Size _size = const Size(1200, 600);
  bool _isFullScreen = false;
  double _previousX = 40;
  double _previousY = 40;
  Size _previousSize = const Size(1200, 600);

  bool checkCursorPositions(double x, double y) {
    if ((x >= 0 && x <= 8 && y >= 0 && y <= 8)) {
      setState(() => _resizePosition = ResizePosition.topLeft);
      return true;
    } else if (y >= 0 && y <= 8 && x >= _size.width - 8 && x <= _size.width) {
      setState(() => _resizePosition = ResizePosition.topRight);
      return true;
    } else if (x >= 0 && x <= 8 && y >= _size.height - 8 && y <= _size.height) {
      setState(() => _resizePosition = ResizePosition.bottomLeft);
      return true;
    } else if (x >= _size.width - 8 &&
        x <= _size.width &&
        y >= _size.height - 8 &&
        y <= _size.height) {
      setState(() => _resizePosition = ResizePosition.bottomRight);
      return true;
    } else if (x >= 0 && x <= 8) {
      setState(() => _resizePosition = ResizePosition.left);
      return true;
    } else if (x >= _size.width - 8 && x <= _size.width) {
      setState(() => _resizePosition = ResizePosition.right);
      return true;
    } else if (y >= 0 && y <= 8) {
      setState(() => _resizePosition = ResizePosition.top);
      return true;
    } else if (y >= _size.height - 8 && y <= _size.height) {
      setState(() => _resizePosition = ResizePosition.bottom);
      return true;
    }
    return false;
  }

  void clickWindowsLogo() {
    setState(() {
      _isStartUpMenuOpen = !_isStartUpMenuOpen;
    });
  }

  void openWindowsElement(
    String? title,
    ImageProvider? image,
  ) {
    setState(() {
      _isWindowsElements = true;
      windowsElementTitle = title;
      windowsElementImage = image;
      if (_isStartUpMenuOpen) {
        _isStartUpMenuOpen = false;
      }
    });
  }

  void closeWindowsElement() {
    setState(() {
      _isWindowsElements = false;
      windowsElementTitle = null;
      windowsElementImage = null;
    });
  }

  void onResize(DragUpdateDetails details) {
    const minWidth = 450.0;
    const minHeight = 400.0;

    switch (_resizePosition) {
      case ResizePosition.topLeft:
        setState(() {
          final newWidth = _size.width - details.delta.dx;
          final newHeight = _size.height - details.delta.dy;
          if (newWidth >= minWidth && newHeight >= minHeight) {
            _x += details.delta.dx;
            _y += details.delta.dy;
            _size = Size(newWidth, newHeight);
          }
        });
        break;
      case ResizePosition.topRight:
        setState(() {
          final newWidth = _size.width + details.delta.dx;
          final newHeight = _size.height - details.delta.dy;
          if (newWidth >= minWidth && newHeight >= minHeight) {
            _y += details.delta.dy;
            _size = Size(newWidth, newHeight);
          }
        });
        break;
      case ResizePosition.bottomLeft:
        setState(() {
          final newWidth = _size.width - details.delta.dx;
          final newHeight = _size.height + details.delta.dy;
          if (newWidth >= minWidth && newHeight >= minHeight) {
            _x += details.delta.dx;
            _size = Size(newWidth, newHeight);
          }
        });
        break;
      case ResizePosition.bottomRight:
        setState(() {
          final newWidth = _size.width + details.delta.dx;
          final newHeight = _size.height + details.delta.dy;
          if (newWidth >= minWidth && newHeight >= minHeight) {
            _size = Size(newWidth, newHeight);
          }
        });
        break;
      case ResizePosition.left:
        setState(() {
          final newWidth = _size.width - details.delta.dx;
          if (newWidth >= minWidth) {
            _x += details.delta.dx;
            _size = Size(newWidth, _size.height);
          }
        });
        break;
      case ResizePosition.right:
        setState(() {
          final newWidth = _size.width + details.delta.dx;
          if (newWidth >= minWidth) {
            _size = Size(newWidth, _size.height);
          }
        });
        break;
      case ResizePosition.top:
        setState(() {
          final newHeight = _size.height - details.delta.dy;
          if (newHeight >= minHeight) {
            _y += details.delta.dy;
            _size = Size(_size.width, newHeight);
          }
        });
        break;
      case ResizePosition.bottom:
        setState(() {
          final newHeight = _size.height + details.delta.dy;
          if (newHeight >= minHeight) {
            _size = Size(_size.width, newHeight);
          }
        });
        break;
      case ResizePosition.none:
        break;
    }
  }

  void toggleFullScreen() {
    setState(() {
      if (_isFullScreen) {
        _x = _previousX;
        _y = _previousY;
        _size = _previousSize;
      } else {
        _previousX = _x;
        _previousY = _y;
        _previousSize = _size;

        _x = 0;
        _y = 0;
        _size = Size(
          MediaQuery.of(context).size.width,
          MediaQuery.of(context).size.height - 48,
        );
      }
      _isFullScreen = !_isFullScreen;
    });
  }

  void startMoving() {
    setState(() {
      _isMoving = true;
      _isResizing = false;
    });
  }

  void stopMoving() {
    setState(() {
      _isMoving = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.watch<ThemeModel>();
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                  'assets/images/w11-${theme.getCurrentTheme == Brightness.dark ? 'dark' : 'light'}.jpg'),
              fit: BoxFit.cover),
        ),
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  const Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 120),
                      child: Text(
                        "Developed in Flutter and being continued to be developed",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(color: Colors.black, blurRadius: 20)
                          ],
                        ),
                      ),
                    ),
                  ),
                  widget.child,
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: DesktopElements(onElementTap: openWindowsElement),
                  ),
                  if (_isWindowsElements)
                    Positioned(
                      top: _y,
                      left: _x,
                      child: GestureDetector(
                        onPanStart: (details) {
                          if (!checkCursorPositions(details.localPosition.dx,
                              details.localPosition.dy)) {
                            startMoving();
                          }
                        },
                        onPanEnd: (details) {
                          stopMoving();
                          if (_isResizing) {
                            setState(() {
                              _isResizing = false;
                            });
                          }
                        },
                        onPanUpdate: (details) {
                          if (_isResizing) {
                            onResize(details);
                            return;
                          }

                          if (_isMoving) {
                            setState(() {
                              _x += details.delta.dx;
                              _y += details.delta.dy;
                            });
                            return;
                          }

                          if (checkCursorPositions(details.localPosition.dx,
                              details.localPosition.dy)) {
                            setState(() {
                              _isResizing = true;
                              _isMoving = false;
                            });
                          }
                        },
                        child: ExplorerWidget(
                          title: windowsElementTitle!,
                          image: windowsElementImage!,
                          closeWindowsElement: closeWindowsElement,
                          toggleFullScreen: toggleFullScreen,
                          size: _size,
                        ),
                      ),
                    ),
                  if (_isStartUpMenuOpen)
                    const Positioned(
                      bottom: 4,
                      left: 16,
                      child: StartUpMenu(),
                    ),
                ],
              ),
            ),
            TaskBar(
              isStartUpMenuOpen: _isStartUpMenuOpen,
              onWindowsLogoClick: clickWindowsLogo,
            ),
          ],
        ),
      ),
    );
  }
}
