import 'package:flutter/material.dart';
import 'package:mert_erim_web/widgets/image_container.dart';
import 'package:mert_erim_web/widgets/informations.dart';

class Desktop extends StatelessWidget {
  const Desktop({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: size.width * 0.2,
          height: size.height,
          color: Colors.grey,
          child: const ImageContainer(),
        ),
        const Informations()
      ],
    );
  }
}
