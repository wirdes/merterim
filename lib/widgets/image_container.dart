import 'package:flutter/material.dart';
import 'package:mert_erim_web/utils/util.dart';

class ImageContainer extends StatelessWidget {
  const ImageContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final size = ViewportContainer.of(context).type == ViewportHelpers.desktop
        ? MediaQuery.of(context).size.width
        : MediaQuery.of(context).size.height * 1.5;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: size * 0.1,
          height: size * 0.1,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage("assets/images/profile.jpg"),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            "MERT",
            style:
                TextStyle(fontSize: size * 0.05, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            width: 20,
          ),
          Text(
            "ERİM",
            style: TextStyle(
                fontSize: size * 0.05,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
        ]),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            "Flutter Developer",
            style:
                TextStyle(fontSize: size * 0.025, fontWeight: FontWeight.bold),
          ),
        ]),
      ],
    );
  }
}
