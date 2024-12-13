import 'package:flutter/material.dart';
import 'package:mert_erim_web/screen/components/clock.dart';

class TaskBar extends StatelessWidget {
  final bool isStartUpMenuOpen;
  final VoidCallback onWindowsLogoClick;

  const TaskBar({
    super.key,
    required this.isStartUpMenuOpen,
    required this.onWindowsLogoClick,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      width: double.infinity,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.black.withAlpha(242), // 0.95 * 255
              Colors.black.withAlpha(230), // 0.9 * 255
              Colors.black.withAlpha(242), // 0.95 * 255
            ],
          ),
        ),
        child: Row(
          children: [
            const SizedBox(width: 16),
            Material(
              borderRadius: BorderRadius.circular(4),
              color: isStartUpMenuOpen
                  ? Colors.white.withAlpha(26) // 0.1 * 255
                  : Colors.transparent,
              child: Tooltip(
                message: 'Başlat',
                child: InkWell(
                  customBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  onTap: onWindowsLogoClick,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      'assets/images/windows_logo.png',
                      width: 24,
                      height: 24,
                    ),
                  ),
                ),
              ),
            ),
            const Spacer(),
            Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {},
                customBorder: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(1),
                  child: Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 8),
                        child: Clock(),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.notifications_none_outlined,
                              color: Colors.white)),
                      const SizedBox(width: 16),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
