import 'package:flutter/material.dart';

class WindowsDesktopElement extends StatelessWidget {
  final String title;
  final void Function()? onTap;
  final ImageProvider image;
  const WindowsDesktopElement(
      {super.key, required this.title, this.onTap, required this.image});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          customBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: 72,
              height: 94,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(image: image, width: 48, height: 48),
                  Text(
                    title,
                    // maxLines: 1,
                    // overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
