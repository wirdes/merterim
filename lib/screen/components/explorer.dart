import 'package:flutter/material.dart';

class ExplorerWidget extends StatelessWidget {
  final void Function()? closeWindowsElement;
  final void Function()? toggleFullScreen;

  final String title;
  final ImageProvider image;
  final Size size;
  const ExplorerWidget({
    super.key,
    required this.title,
    required this.image,
    this.closeWindowsElement,
    this.toggleFullScreen,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      height: size.height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: const Color.fromARGB(255, 26, 21, 19),
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                  height: 4,
                  width: double.infinity,
                  child: Row(
                    children: [
                      MouseRegion(
                        cursor: SystemMouseCursors.resizeUpLeft,
                        child: GestureDetector(
                          child: Container(
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(8),
                                topRight: Radius.circular(8),
                              ),
                            ),
                            width: 8,
                            height: 8,
                          ),
                        ),
                      ),
                      const Spacer(),
                      MouseRegion(
                        cursor: SystemMouseCursors.resizeUpRight,
                        child: GestureDetector(
                          child: Container(
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(8),
                                topRight: Radius.circular(8),
                              ),
                            ),
                            width: 8,
                            height: 8,
                          ),
                        ),
                      ),
                    ],
                  )),
              Row(
                children: [
                  const SizedBox(width: 16),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Container(
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(138, 48, 39, 35),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8),
                            topRight: Radius.circular(8),
                          ),
                        ),
                        width: 200,
                        child: Row(
                          children: [
                            const SizedBox(width: 16),
                            Material(
                              borderRadius: BorderRadius.circular(4),
                              color: Colors.transparent,
                              child: InkWell(
                                customBorder: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                onTap: () {},
                                child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image(
                                        image: image, width: 24, height: 24)),
                              ),
                            ),
                            Text(
                              title,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        )),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: SizedBox(
                      height: 48,
                      child: Row(
                        children: [
                          Material(
                            color: Colors.transparent,
                            child: InkWell(
                                onTap: () {},
                                child: Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Icon(Icons.remove,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary,
                                      size: 24),
                                )),
                          ),
                          Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: toggleFullScreen,
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: Icon(
                                  Icons.crop_square,
                                  size: 24,
                                  color:
                                      Theme.of(context).colorScheme.onPrimary,
                                ),
                              ),
                            ),
                          ),
                          Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: closeWindowsElement,
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: Icon(
                                  Icons.close,
                                  size: 24,
                                  color:
                                      Theme.of(context).colorScheme.onPrimary,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                ],
              ),
              Container(
                width: double.infinity,
                height: 40,
                color: const Color.fromARGB(138, 48, 39, 35),
                child: const Row(
                  children: [
                    SizedBox(width: 16),
                    Text(
                      'Dosya',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {},
                  child: GestureDetector(
                    onPanUpdate: (details) {},
                    onPanCancel: () {},
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      color: const Color.fromARGB(138, 48, 39, 35),
                      child: const Center(
                        child: Text(
                          'Mert Erim CV',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          Positioned(
            left: 0,
            top: 0,
            bottom: 0,
            child: MouseRegion(
              cursor: SystemMouseCursors.resizeLeftRight,
              child: Container(width: 8, color: Colors.transparent),
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            bottom: 0,
            child: MouseRegion(
              cursor: SystemMouseCursors.resizeLeftRight,
              child: Container(width: 8, color: Colors.transparent),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: MouseRegion(
              cursor: SystemMouseCursors.resizeUpDown,
              child: Container(height: 8, color: Colors.transparent),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: MouseRegion(
              cursor: SystemMouseCursors.resizeUpDown,
              child: Container(height: 8, color: Colors.transparent),
            ),
          ),
          Positioned(
            left: 0,
            top: 0,
            child: MouseRegion(
              cursor: SystemMouseCursors.resizeUpLeftDownRight,
              child: Container(width: 8, height: 8, color: Colors.transparent),
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            child: MouseRegion(
              cursor: SystemMouseCursors.resizeUpRightDownLeft,
              child: Container(width: 8, height: 8, color: Colors.transparent),
            ),
          ),
          Positioned(
            left: 0,
            bottom: 0,
            child: MouseRegion(
              cursor: SystemMouseCursors.resizeUpRightDownLeft,
              child: Container(width: 8, height: 8, color: Colors.transparent),
            ),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: MouseRegion(
              cursor: SystemMouseCursors.resizeUpLeftDownRight,
              child: Container(width: 8, height: 8, color: Colors.transparent),
            ),
          ),
        ],
      ),
    );
  }
}
