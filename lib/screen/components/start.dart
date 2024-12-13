import 'package:flutter/material.dart';

class StartUpMenu extends StatelessWidget {
  const StartUpMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 480,
      height: 520,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: const Color.fromARGB(255, 26, 21, 19)),
      child: Column(
        children: [
          const Spacer(),
          Container(
            height: 56,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(8),
                bottomRight: Radius.circular(8),
              ),
              color: Colors.black.withAlpha(204), // 0.8 * 255
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(width: 32),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    customBorder: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4)),
                    onTap: () {},
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 16,
                            child: Icon(Icons.person, size: 20),
                          ),
                          SizedBox(width: 8),
                          Text(
                            'Mert Erim',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    customBorder: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    onTap: () {},
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Icons.power_settings_new,
                          size: 24, color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(width: 32),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
